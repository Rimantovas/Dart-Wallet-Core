use self::functions::process_methods;
use self::inits::process_inits;
use self::properties::process_properties;
use self::render::pretty_name;
use crate::manifest::{DeinitInfo, FileInfo, ParamInfo, ProtoInfo, TypeInfo, TypeVariant};
use crate::{Error, Result};
use handlebars::Handlebars;
use serde_json::json;
use std::fmt::Display;

mod functions;
mod inits;
mod properties;
mod render;

// Re-exports
pub use self::render::{
    generate_dart_types, render_to_strings, GeneratedDartTypes, GeneratedDartTypesStrings,
    RenderIntput,
};

/// Represents a Dart struct or class.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartStruct {
    name: String,
    is_class: bool,
    is_public: bool,
    init_instance: bool,
    superclasses: Vec<String>,
    eq_operator: Option<DartOperatorEquality>,
    inits: Vec<DartInit>,
    deinits: Vec<DeinitInfo>,
    methods: Vec<DartFunction>,
    properties: Vec<DartProperty>,
}

/// Represents a Dart enum.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartEnum {
    name: String,
    is_public: bool,
    add_description: bool,
    value_type: String,
    variants: Vec<DartEnumVariant>,
}

/// Represents a Dart enum variant.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartEnumVariant {
    name: String,
    value: String,
    as_string: Option<String>,
}

/// Represents associated methods and properties of an enum. Based on the first
/// codegen, those extensions are placed in a separate file.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartEnumExtension {
    name: String,
    init_instance: bool,
    methods: Vec<DartFunction>,
    properties: Vec<DartProperty>,
}

// Wrapper around a valid Dart type (built in or custom). Meant to be used as
// `<DartType as From<TypeVariant>>::from(...)`.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartType(String);

impl Display for DartType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.0)
    }
}

/// Represents a Dart function or method.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartFunction {
    pub name: String,
    pub is_public: bool,
    pub is_static: bool,
    pub params: Vec<DartParam>,
    pub operations: Vec<DartOperation>,
    #[serde(rename = "return")]
    pub return_type: DartReturn,
    pub comments: Vec<String>,
}

/// Represents a Dart property of a struct/class or enum.
#[derive(Debug, Clone, Serialize, Deserialize)]
struct DartProperty {
    pub name: String,
    pub is_public: bool,
    pub operations: Vec<DartOperation>,
    #[serde(rename = "return")]
    pub return_type: DartReturn,
    pub comments: Vec<String>,
}

/// The operation to be interpreted by the templating engine. This handles
/// parameters and C FFI calls in an appropriate way, depending on context.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum DartOperation {
    // Results in:
    // ```dart
    // var <var_name> = <call>;
    // try {
    //     <defer.String>(<var_name>);
    // } finally {
    //     Defer logic in Dart (if any)
    // }
    // ```
    Call {
        var_name: String,
        call: String,
        defer: Option<String>,
    },
    // Results in:
    // ```dart
    // var ptr;
    // if (<var_name> != null) {
    //     ptr = <call>;
    // } else {
    //     ptr = null;
    // }
    // try {
    //     if (ptr != null) {
    //         <defer.String>(ptr);
    //     }
    // } finally {
    //      Defer logic in Dart (if any)
    // }
    // ```
    CallOptional {
        var_name: String,
        call: String,
        defer: Option<String>,
    },
    // Results in:
    // ```dart
    // var <var_name> = <call>;
    // if (<var_name> == null) {
    //     return null;
    // }
    // ```
    GuardedCall {
        var_name: String,
        call: String,
    },
    // Results in:
    // ```dart
    // return <call>;
    // ```
    Return {
        call: String,
    },
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartParam {
    pub name: String,
    #[serde(rename = "type")]
    pub param_type: DartType,
    pub variant: TypeVariant,
    pub is_nullable: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartReturn {
    #[serde(rename = "type")]
    pub param_type: DartType,
    pub is_nullable: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartInit {
    pub class_name: String,
    pub constructor_name: String,
    pub is_nullable: bool,
    pub is_public: bool,
    pub params: Vec<DartParam>,
    pub operations: Vec<DartOperation>,
    pub comments: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartProto {
    pub name: String,
    pub c_ffi_name: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartOperatorEquality {
    pub c_ffi_name: String,
}

/// Used for the individual `process_*` functions.
enum ObjectVariant<'a> {
    Struct(&'a str),
    Enum(&'a str),
}

impl<'a> ObjectVariant<'a> {
    fn name(&'a self) -> &'a str {
        match self {
            ObjectVariant::Struct(n) | ObjectVariant::Enum(n) => n,
        }
    }
}

impl TryFrom<ProtoInfo> for DartProto {
    type Error = Error;

    fn try_from(value: ProtoInfo) -> std::result::Result<Self, Self::Error> {
        Ok(DartProto {
            // Convert the name into an appropriate format.
            name: pretty_name(value.0.clone()),
            c_ffi_name: value.0,
        })
    }
}

/// Convert the `TypeVariant` into the appropriate Dart type.
impl From<TypeVariant> for DartType {
    fn from(value: TypeVariant) -> Self {
        let res = match value {
            TypeVariant::Void => "void".to_string(),
            TypeVariant::Bool => "bool".to_string(),
            TypeVariant::Char => "String".to_string(),
            TypeVariant::ShortInt => "int".to_string(),
            TypeVariant::Int => "int".to_string(),
            TypeVariant::UnsignedInt => "int".to_string(),
            TypeVariant::LongInt => "int".to_string(),
            TypeVariant::Float => "double".to_string(),
            TypeVariant::Double => "double".to_string(),
            TypeVariant::SizeT => "int".to_string(),
            TypeVariant::Int8T => "int".to_string(),
            TypeVariant::Int16T => "int".to_string(),
            TypeVariant::Int32T => "int".to_string(),
            TypeVariant::Int64T => "int".to_string(),
            TypeVariant::UInt8T => "int".to_string(),
            TypeVariant::UInt16T => "int".to_string(),
            TypeVariant::UInt32T => "int".to_string(),
            TypeVariant::UInt64T => "int".to_string(),
            TypeVariant::String => "String".to_string(),
            TypeVariant::Data => "Uint8List".to_string(),
            TypeVariant::Struct(n) | TypeVariant::Enum(n) => {
                // We strip the "TW" prefix for Dart representations of
                // structs/enums.
                n.strip_prefix("TW")
                    .map(|n| n.to_string())
                    .unwrap_or(n.to_string())
            }
        };

        DartType(res)
    }
}

// Covenience function: process the parameter, returning the operation for
// handling the C FFI call (if any).
fn param_c_ffi_call(param: &ParamInfo) -> Option<DartOperation> {
    let fname = format!("{}0", param.name);
    let op = match &param.ty.variant {
        // E.g. `let param = TWStringCreateWithNSString(param)`
        TypeVariant::String => {
            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                let (var_name, call, defer) = (
                    param.name.clone(),
                    format!("TWStringCreateWithNSString({})", param.name),
                    Some(format!("WalletCore.wcb.TWStringDelete(ptr)")),
                );
                DartOperation::CallOptional {
                    var_name,
                    call,
                    defer,
                }
            } else {
                let (var_name, call, defer) = (
                    fname.clone(),
                    format!("TWStringCreateWithNSString({})", param.name),
                    Some(format!("WalletCore.wcb.TWStringDelete({})", fname)),
                );

                DartOperation::Call {
                    var_name,
                    call,
                    defer,
                }
            }
        }
        TypeVariant::Data => {
            let (var_name, call, defer) = (
                fname.clone(),
                format!("TWDataCreateWithNSData({})", param.name),
                Some(format!("WalletCore.wcb.TWDataDelete({})", fname)),
            );

            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                DartOperation::CallOptional {
                    var_name,
                    call,
                    defer,
                }
            } else {
                DartOperation::Call {
                    var_name,
                    call,
                    defer,
                }
            }
        }
        // E.g.
        // - `let param = param.rawValue`
        // - `let param = param?.rawValue`
        TypeVariant::Struct(_) => {
            // For nullable structs, we do not use the special
            // `CallOptional` handler but rather use the question mark
            // operator.
            let (var_name, call, defer) = if param.ty.is_nullable {
                (
                    fname.clone(),
                    format!("{}?.rawValue ?? nullptr", param.name),
                    None,
                )
            } else {
                (fname.clone(), format!("{}.rawValue", param.name), None)
            };

            DartOperation::Call {
                var_name,
                call,
                defer,
            }
        }
        // E.g. `let param = SomeEnum(param.rawValue)`
        // Note that it calls the constructor of the enum, which calls
        // the underlying "*Create*" C FFI function.
        TypeVariant::Enum(_) => DartOperation::Call {
            var_name: fname.clone(),
            call: format!("{}.value", param.name),
            defer: None,
        },
        // Skip processing parameter, reference the parameter by name
        // directly, as defined in the function interface (usually the
        // case for primitive types).
        _ => return None,
    };

    Some(op)
}

fn did_process_params(variant: TypeVariant) -> bool {
    match variant {
        TypeVariant::String | TypeVariant::Data | TypeVariant::Struct(_) | TypeVariant::Enum(_) => {
            true
        }
        _ => false,
    }
}

// Convenience funcion: wrap the return value, returning the operation. Note
// that types are wrapped differently when returning, compared to
// `param_c_ffi_call`; such as using `TWStringNSString` instead of
// `TWDataCreateWithNSData` for Strings.
fn wrap_return(ty: &TypeInfo) -> DartOperation {
    match &ty.variant {
        // E.g.`return TWStringNSString(result)`
        TypeVariant::String => DartOperation::Return {
            call: "TWStringNSString(result)".to_string(),
        },
        TypeVariant::Data => DartOperation::Return {
            call: "TWDataNSData(result)".to_string(),
        },
        // E.g. `return SomeEnum.fromValue(result.rawValue)`
        TypeVariant::Enum(_) => DartOperation::Return {
            call: format!("{}.fromValue(result)!", DartType::from(ty.variant.clone())),
        },
        // E.g. `return SomeStruct(result)`
        TypeVariant::Struct(_) => DartOperation::Return {
            call: format!("{}(result)", DartType::from(ty.variant.clone())),
        },
        _ => DartOperation::Return {
            call: "result".to_string(),
        },
    }
}
