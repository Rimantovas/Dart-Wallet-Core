use crate::grammar::{
    GEnumDecl, GFunctionDecl, GHeaderInclude, GMarker, GMarkers, GPrimitive, GStructDecl, GType,
    GTypeCategory,
};
use crate::manifest::*;
use crate::{Error, Result};

impl TypeInfo {
    pub fn from_g_type(ty: &GType, markers: &GMarkers) -> Result<Self> {
        pub fn get_variant(category: &GTypeCategory) -> Result<TypeVariant> {
            let variant = match category {
                GTypeCategory::Scalar(s) => match s {
                    GPrimitive::Void => TypeVariant::Void,
                    GPrimitive::Bool => TypeVariant::Bool,
                    GPrimitive::Char => TypeVariant::Char,
                    GPrimitive::ShortInt => TypeVariant::ShortInt,
                    GPrimitive::Int => TypeVariant::Int,
                    GPrimitive::UnsignedInt => TypeVariant::UnsignedInt,
                    GPrimitive::LongInt => TypeVariant::LongInt,
                    GPrimitive::Float => TypeVariant::Float,
                    GPrimitive::Double => TypeVariant::Double,
                    GPrimitive::SizeT => TypeVariant::SizeT,
                    GPrimitive::Int8T => TypeVariant::Int8T,
                    GPrimitive::Int16T => TypeVariant::Int16T,
                    GPrimitive::Int32T => TypeVariant::Int32T,
                    GPrimitive::Int64T => TypeVariant::Int64T,
                    GPrimitive::UInt8T => TypeVariant::UInt8T,
                    GPrimitive::UInt16T => TypeVariant::UInt16T,
                    GPrimitive::UInt32T => TypeVariant::UInt32T,
                    GPrimitive::UInt64T => TypeVariant::UInt64T,
                },
                GTypeCategory::Struct(s) => TypeVariant::Struct(s.0 .0.to_string()),
                GTypeCategory::Enum(e) => TypeVariant::Enum(e.0 .0.to_string()),
                GTypeCategory::Pointer(_) | GTypeCategory::Unrecognized(_) => {
                    return Err(Error::BadFormat("Invalid type category".to_string()));
                }
            };

            Ok(variant)
        }

        pub fn get_variant_pointer_check(cat: &GTypeCategory) -> Result<(TypeVariant, bool)> {
            let res = match cat {
                GTypeCategory::Pointer(p) => (get_variant(&*p)?, true),
                _ => (get_variant(cat)?, false),
            };

            Ok(res)
        }

        let is_nullable = markers.0.iter().any(|m| match m {
            GMarker::Nullable => true,
            GMarker::NonNull => false,
            _ => false,
        });

        // Special handler for `TW_DATA` and `TW_STRING`.
        match ty {
            GType::Mutable(GTypeCategory::Pointer(pointer))
            | GType::Const(GTypeCategory::Pointer(pointer)) => {
                if let GTypeCategory::Unrecognized(ref keyword) = **pointer {
                    if keyword.0 == "TWData" {
                        return Ok(TypeInfo {
                            variant: TypeVariant::Data,
                            // Is always const
                            is_constant: true,
                            is_nullable,
                            is_pointer: true,
                        });
                    } else if keyword.0 == "TWString" {
                        return Ok(TypeInfo {
                            variant: TypeVariant::String,
                            // Is always const
                            is_constant: true,
                            is_nullable,
                            is_pointer: true,
                        });
                    }
                }
            }
            _ => {}
        }

        let ((variant, is_pointer), is_constant) = match ty {
            GType::Mutable(category) => (get_variant_pointer_check(category)?, false),
            GType::Const(category) => (get_variant_pointer_check(category)?, true),
            GType::Extern(_) => {
                return Err(Error::BadFormat("Extern type not supported".to_string()));
                // TODO: Where should this be handled?
            }
        };

        Ok(TypeInfo {
            variant,
            is_constant,
            is_nullable,
            is_pointer,
        })
    }
}

impl ImportInfo {
    pub fn from_g_type(value: &GHeaderInclude) -> Result<Self> {
        let mut path: Vec<String> = value.0.split('/').map(|s| s.to_string()).collect();

        if path.is_empty() {
            return Err(Error::BadFormat("Empty import path".to_string()));
        }

        if let Some(file_name) = path.last_mut() {
            *file_name = file_name
                .strip_suffix(".h")
                .ok_or(Error::BadFormat("Invalid header file name".to_string()))
                .map(|s| s.to_string())?;
        }

        Ok(ImportInfo { path })
    }
}

impl EnumInfo {
    pub fn from_g_type(value: &GEnumDecl) -> Result<Self> {
        // Extract the prefix from enum name, if any, to help with name processing
        let enum_name = value.name.0.to_string();

        let value_type = TypeVariant::UInt32T;

        Ok(EnumInfo {
            name: enum_name.clone(),
            is_public: true,
            value_type,
            variants: value
                .variants
                .iter()
                .cloned()
                .map(|(k, v)| {
                    let original_name = k.0.clone();

                    // Format the name by removing prefix and converting to camelCase
                    let name = Self::format_variant_name(&enum_name, &original_name);

                    // Use the numeric value directly, default to 0 if not provided
                    let numeric_value = v.unwrap_or(0) as i64;

                    EnumVariantInfo {
                        name,
                        value: numeric_value,
                        as_string: None,
                    }
                })
                .collect(),
        })
    }

    /// Format an enum variant name by removing the prefix and converting to camelCase
    fn format_variant_name(enum_name: &str, variant_name: &str) -> String {
        let name = if variant_name.starts_with(enum_name) {
            &variant_name[enum_name.len()..]
        } else {
            variant_name
        };

        if name.is_empty() {
            return String::new();
        }

        let contains_acronym = name
            .chars()
            .zip(name.chars().skip(1))
            .any(|(a, b)| a.is_uppercase() && b.is_uppercase());

        if contains_acronym {
            return name.to_lowercase();
        } else {
            let mut result = String::new();
            let mut chars = name.chars();

            if let Some(first_char) = chars.next() {
                result.push(first_char.to_lowercase().next().unwrap());
            }

            result.extend(chars);
            return result;
        }
    }
}

impl StructInfo {
    pub fn from_g_type(value: &GStructDecl) -> Result<Self> {
        let mut markers = value.markers.0.iter();

        if markers.size_hint().0 != 1 {
            return Err(Error::BadFormat(
                "Invalid marker count for struct".to_string(),
            ));
        }

        // Identify whether it's a struct or a class. The object must be *one*
        // of the two available markers and is always public
        let is_class = match markers.next() {
            Some(GMarker::TwExportStruct) => false,
            Some(GMarker::TwExportClass) => true,
            _ => return Err(Error::BadFormat("Invalid marker for struct".to_string())),
        };

        // Process fields.
        let fields = value
            .fields
            .iter()
            .map(|(k, v)| {
                Ok((
                    k.0.to_string(),
                    // In this context, types inside a C struct do not support
                    // markers.
                    TypeInfo::from_g_type(v, &GMarkers(vec![]))?,
                ))
            })
            .collect::<Result<Vec<(String, TypeInfo)>>>()?;

        Ok(StructInfo {
            name: value.name.0 .0.to_string(),
            is_public: true,
            is_class,
            fields,
        })
    }
}

impl PropertyInfo {
    pub fn from_g_type(value: &GFunctionDecl) -> Result<Self> {
        // ### Name

        // Strip the object name from the property name.
        // E.g. "SomeObjectIsValid" => "IsValid"
        let name = value.name.0.clone();

        if name.is_empty() {
            return Err(Error::BadFormat("Empty property name".to_string()));
        }

        // ### Marker

        let mut markers = value.markers.0.iter();

        // Must have one marker.
        if markers.size_hint().0 != 1 {
            return Err(Error::BadFormat(
                "Invalid marker count for property".to_string(),
            ));
        }

        // The property must have one of the two available markers and is always public.
        let is_public = match markers.next() {
            Some(GMarker::TwExportProperty) => true,
            Some(GMarker::TwExportStaticProperty) => true,
            _ => return Err(Error::BadFormat("Invalid marker for property".to_string())),
        };

        // ### Param

        // Must have at least one parameter.
        if value.params.len() < 1 {
            return Err(Error::BadFormat(
                "Property must have at least one parameter".to_string(),
            ));
        }

        // ### Return value

        // Extract return value.
        let re = &value.return_value;
        let return_type = TypeInfo::from_g_type(&re.ty, &re.markers)?;

        Ok(PropertyInfo {
            name,
            is_public,
            return_type,
            comments: vec![],
        })
    }
}

impl InitInfo {
    pub fn from_g_type(value: &GFunctionDecl) -> Result<Self> {
        let func = FunctionInfo::from_g_type(&None, value)?;

        let mut return_markers = value.return_value.markers.0.iter();

        let is_nullable = return_markers.any(|m| match m {
            GMarker::Nullable => true,
            GMarker::NonNull => false,
            _ => true,
        });

        Ok(InitInfo {
            name: func.name,
            is_public: true,
            is_nullable,
            params: func.params,
            comments: vec![],
        })
    }
}

impl DeinitInfo {
    pub fn from_g_type(value: &GFunctionDecl) -> Result<Self> {
        let func = FunctionInfo::from_g_type(&None, value)?;

        Ok(DeinitInfo { name: func.name })
    }
}

impl FunctionInfo {
    pub fn from_g_type(object_name: &Option<String>, value: &GFunctionDecl) -> Result<Self> {
        // ### Name

        // Strip the object name from the method name.
        // E.g. "SomeObjectIsValid" => "IsValid"
        let name = if let Some(object_name) = object_name {
            match value.name.0.strip_prefix(object_name) {
                Some(suffix) => suffix.to_string(),
                None => value.name.0.to_string(),
            }
        } else {
            value.name.0.to_string()
        };

        if name.is_empty() {
            return Err(Error::BadFormat("Empty function name".to_string()));
        }

        // ### Marker

        let mut markers = value.markers.0.iter();

        // The method must have one of the two available markers and is always public.
        let (is_static, is_public) = match markers.next() {
            Some(GMarker::TwExportMethod) => (false, true),
            Some(GMarker::TwExportStaticMethod) => (true, true),
            // TODO:?
            //_ => return Err(Error::BadObject),
            _ => (false, false),
        };

        // ### Params

        let mut g_params = value.params.iter();

        // Convert parameters.
        let mut params = vec![];
        while let Some(g_item) = g_params.next() {
            params.push(ParamInfo {
                name: g_item.name.0.to_string(),
                ty: TypeInfo::from_g_type(&g_item.ty, &g_item.markers)?,
            })
        }

        // ### Return value

        // Extract return value.
        let re = &value.return_value;
        let return_type = TypeInfo::from_g_type(&re.ty, &re.markers)?;

        Ok(FunctionInfo {
            name,
            is_public,
            is_static,
            params,
            return_type,
            comments: vec![],
        })
    }
}
