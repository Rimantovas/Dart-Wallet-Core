use super::*;
use crate::codegen::dart::render::pretty_name;
use crate::manifest::InitInfo;

/// This function checks each constructor and determines whether there's an
/// association with the passed on object (struct or enum), based on common name
/// prefix, and maps the data into a Dart structure.
///
/// This function returns a tuple of associated Dart constructor and the skipped
/// respectively non-associated constructors.
pub(super) fn process_inits(
    object: &ObjectVariant,
    inits: Vec<InitInfo>,
) -> Result<(Vec<DartInit>, Vec<InitInfo>)> {
    let mut dart_inits = vec![];
    let mut skipped_inits = vec![];

    for init in inits {
        let object_name = object.name();
        if !init.name.starts_with(object_name) {
            // Init is not assciated with the object.
            skipped_inits.push(init);
            continue;
        }

        let mut ops = vec![];

        // For each parameter, we track a list of `params` which is used for the
        // function interface and add the necessary operations on how to process
        // those parameters.
        let mut params = vec![];
        for param in init.params {
            // Convert parameter to Dart parameter.
            params.push(DartParam {
                name: param.name.clone(),
                param_type: DartType::from(param.ty.variant.clone()),
                variant: param.ty.variant.clone(),
                is_nullable: param.ty.is_nullable,
            });

            // Process parameter.
            if let Some(op) = param_c_ffi_call(&param) {
                ops.push(op);
            }
        }

        // Prepepare parameter list to be passed on to the underlying C FFI function.
        let param_names = params
            .iter()
            .map(|p| {
                if did_process_params(p.variant.clone()) {
                    p.name.clone() + "0"
                } else {
                    p.name.clone()
                }
            })
            .collect::<Vec<String>>()
            .join(",");

        // Call the underlying C FFI function, passing on the parameter list.
        if init.is_nullable {
            ops.push(DartOperation::GuardedCall {
                var_name: "result".to_string(),
                call: format!("WalletCore.wcb.{}({})", init.name, param_names),
            });
        } else {
            ops.push(DartOperation::Call {
                var_name: "result".to_string(),
                call: format!("WalletCore.wcb.{}({})", init.name, param_names),
                defer: None,
            });
        }

        // Note that we do not return a value here; the template sets a
        // `this.rawValue = result` entry at the end of the constructor.

        // Prettify name, remove object name prefix from this property.
        let mut constructor_name = init
            .name
            .strip_prefix(&object_name)
            // Panic implies bug, checked at the start of the loop.
            .unwrap_or(&init.name)
            .to_string();

        // Convert first character of method name to lowercase
        constructor_name = constructor_name
            .chars()
            .next()
            .unwrap()
            .to_lowercase()
            .collect::<String>()
            + &constructor_name[1..];

        dart_inits.push(DartInit {
            class_name: pretty_name(object_name.to_owned()),
            constructor_name: pretty_name(constructor_name),
            is_nullable: init.is_nullable,
            is_public: init.is_public,
            params,
            operations: ops,
            comments: vec![],
        });
    }

    Ok((dart_inits, skipped_inits))
}

pub(super) fn process_deinits(
    object: &ObjectVariant,
    deinit: Vec<DeinitInfo>,
) -> Result<(Vec<DeinitInfo>, Vec<DeinitInfo>)> {
    let mut dart_deinits = vec![];
    let mut skipped_deinits = vec![];

    for deinit in deinit {
        if deinit.name.starts_with(object.name()) {
            dart_deinits.push(deinit)
        } else {
            // Deinit is not assciated with the object.
            skipped_deinits.push(deinit);
            continue;
        }
    }

    Ok((dart_deinits, skipped_deinits))
}
