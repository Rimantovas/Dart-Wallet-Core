use super::*;
use crate::manifest::{FunctionInfo, TypeVariant};
use heck::ToLowerCamelCase;

/// This function checks each function and determines whether there's an
/// association with the passed on object (struct or enum), based on common name
/// prefix, and maps the data into a Dart structure.
///
/// This function returns a tuple of associated Dart functions and the skipped
/// respectively non-associated functions.
pub(super) fn process_methods(
    object: &ObjectVariant,
    functions: Vec<FunctionInfo>,
) -> Result<(Vec<DartFunction>, Vec<FunctionInfo>)> {
    let mut dart_funcs = vec![];
    let mut skipped_funcs = vec![];

    for func in functions {
        if !func.name.starts_with(object.name()) {
            // Function is not assciated with the object.
            skipped_funcs.push(func);
            continue;
        }

        let mut ops = vec![];

        // Initalize the 'self' type, which is then passed on to the underlying
        // C FFI function, assuming the function is not static.
        //
        // E.g:
        // - `let obj = rawValue`
        // - `let obj = value`
        if !func.is_static {
            ops.push(match object {
                ObjectVariant::Struct(_) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: "rawValue".to_string(),
                    defer: None,
                },
                ObjectVariant::Enum(_) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: format!("rawValue"),
                    defer: None,
                },
            });
        }

        // For each parameter, we track a list of `params` which is used for the
        // function interface and add the necessary operations on how to process
        // those parameters.
        let mut params = vec![];
        for param in func.params {
            // Skip self parameter
            match &param.ty.variant {
                TypeVariant::Enum(name) | TypeVariant::Struct(name) if name == object.name() => {
                    continue
                }
                _ => {}
            }

            // Convert parameter to Dart parameter for the function interface.
            params.push(DartParam {
                name: param.name.clone(),
                param_type: DartType::from(&param.ty),
                variant: param.ty.variant.clone(),
                is_nullable: param.ty.is_nullable,
            });

            // Process parameter.
            if let Some(op) = param_c_ffi_call(&param) {
                ops.push(op)
            }
        }

        // Prepepare parameter list to be passed on to the underlying C FFI function.
        let param_name = if func.is_static { vec![] } else { vec!["obj"] };
        let param_names = param_name
            .into_iter()
            .map(|s| s.to_owned())
            .chain(params.iter().map(|p| {
                if did_process_params(p.variant.clone()) {
                    p.name.clone() + "0"
                } else {
                    p.name.clone()
                }
            }))
            .collect::<Vec<String>>()
            .join(",");

        // Call the underlying C FFI function, passing on the parameter list.
        let (var_name, call) = (
            "result".to_string(),
            format!("WalletCore.wcb.{}({})", func.name, param_names),
        );
        if func.return_type.is_nullable {
            ops.push(DartOperation::GuardedCall { var_name, call });
        } else {
            ops.push(DartOperation::Call {
                var_name,
                call,
                defer: None,
            });
        }

        // Wrap result.
        ops.push(wrap_return(&func.return_type));

        // Convert return type for function interface.
        let return_type = DartReturn {
            param_type: DartType::from(&func.return_type),
            is_nullable: func.return_type.is_nullable,
        };

        // Prettify name, remove object name prefix from this property.
        let pretty_name = func
            .name
            .strip_prefix(object.name())
            // Panicing implies bug, checked at the start of the loop.
            .unwrap()
            .to_lower_camel_case();

        // Special handling: some functions do not follow standard camelCase
        // convention.
        #[rustfmt::skip]
        let pretty_name = if object.name() == "TWStoredKey" {
            pretty_name
                .replace("Json", "JSON")
                .replace("Hd", "HD")
        } else if object.name() == "TWPublicKey" {
            pretty_name
                .replace("Der", "DER")
        } else if object.name() == "TWHash" {
            pretty_name
                .replace("ripemd", "RIPEMD")
                .replace("Ripemd", "RIPEMD")
                .replace("sha512256", "sha512_256")
                .replace("sha3256", "sha3_256")
                .replace("sha256sha256", "sha256SHA256")
        } else if object.name() == "TWAES" {
            pretty_name
                .replace("Cbc", "CBC")
                .replace("Ctr", "CTR")
        } else {
            pretty_name
        };

        dart_funcs.push(DartFunction {
            name: pretty_name,
            is_public: func.is_public,
            is_static: func.is_static,
            operations: ops,
            params,
            return_type,
            comments: vec![],
        });
    }

    Ok((dart_funcs, skipped_funcs))
}
