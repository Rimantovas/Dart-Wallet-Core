use super::Result;
use crate::grammar::CHeaderDirectory;
use crate::grammar::{GHeaderFileItem, GMarker};
use std::fs;
use std::path::Path;

pub fn process_c_header_dir(dir: &CHeaderDirectory) -> Vec<FileInfo> {
    let mut file_infos = vec![];

    for (path, items) in &dir.map {
        let file_name = path
            .file_name()
            .unwrap()
            .to_str()
            .unwrap()
            .strip_suffix(".h")
            .unwrap()
            .to_string();

        let mut file_info = FileInfo {
            name: file_name.clone(),
            structs: vec![],
            inits: vec![],
            deinits: vec![],
            enums: vec![],
            functions: vec![],
            properties: vec![],
            protos: vec![],
        };

        for item in items {
            match item {
                GHeaderFileItem::StructIndicator(decl) => {
                    let markers = &decl.markers.0;

                    let mut is_class = false;
                    let mut is_public = false;
                    if markers.contains(&GMarker::TwExportStruct) {
                        is_class = false;
                        is_public = true;
                    } else if markers.contains(&GMarker::TwExportClass) {
                        is_class = true;
                        is_public = true;
                    }

                    if !file_info
                        .structs
                        .iter()
                        .any(|s| s.name == decl.name.0 .0.clone())
                    {
                        file_info.structs.push(StructInfo {
                            name: decl.name.0 .0.clone(),
                            is_public,
                            fields: vec![],
                            is_class,
                        });
                    }
                }
                GHeaderFileItem::StructDecl(decl) => {
                    let x = StructInfo::from_g_type(decl).unwrap();

                    let existing_idx = file_info.structs.iter().position(|s| s.name == x.name);
                    if let Some(idx) = existing_idx {
                        file_info.structs[idx] = x;
                    } else {
                        file_info.structs.push(x);
                    }
                }
                GHeaderFileItem::EnumDecl(decl) => {
                    let x = EnumInfo::from_g_type(decl).unwrap();
                    file_info.enums.push(x);
                }
                GHeaderFileItem::FunctionDecl(decl) => {
                    if decl.name.0.starts_with("TWAnySigner") {
                        println!(
                            "Skipped function from manifest (non-export):  {}",
                            decl.name.0
                        );
                        continue;
                    }

                    let markers = &decl.markers.0;

                    if markers.contains(&GMarker::TwExportProperty)
                        || markers.contains(&GMarker::TwExportStaticProperty)
                    {
                        let x = PropertyInfo::from_g_type(decl).unwrap();
                        file_info.properties.push(x);
                    } else {
                        if decl.name.0.contains("Create") {
                            let x = InitInfo::from_g_type(decl).unwrap();
                            file_info.inits.push(x);
                        } else if decl.name.0.contains("Delete") {
                            let x = DeinitInfo::from_g_type(decl).unwrap();
                            file_info.deinits.push(x);
                        } else {
                            let x = FunctionInfo::from_g_type(&None, decl).unwrap();
                            file_info.functions.push(x);
                        }
                    }
                }
                _ => {}
            }
        }

        file_infos.push(file_info);
    }

    file_infos
}

// ================================
// Manifest
// ================================

pub fn parse_dir<P: AsRef<Path>>(path: P) -> Result<Vec<FileInfo>> {
    let entries = fs::read_dir(path)?;

    let mut file_infos = vec![];
    for entry in entries {
        let entry = entry?;
        let file_path = entry.path();

        if file_path.is_dir() {
            println!("Found unexpected directory: {}", file_path.display());
            continue;
        }

        let file_contents = fs::read_to_string(&file_path)?;

        let info = parse_str(&file_contents)?;
        file_infos.push(info);
    }

    Ok(file_infos)
}

pub fn parse_str(str: &str) -> Result<FileInfo> {
    serde_yaml::from_str(str).map_err(|err| err.into())
}

#[derive(Debug, Clone, Eq, PartialEq, Serialize, Deserialize)]
pub struct TypeInfo {
    #[serde(flatten)]
    pub variant: TypeVariant,
    pub is_constant: bool,
    pub is_nullable: bool,
    pub is_pointer: bool,
}

#[derive(Debug, Clone, Eq, PartialEq, Serialize, Deserialize)]
#[serde(tag = "variant", content = "value", rename_all = "snake_case")]
pub enum TypeVariant {
    Void,
    Bool,
    Char,
    ShortInt,
    Int,
    UnsignedInt,
    LongInt,
    Float,
    Double,
    SizeT,
    Int8T,
    Int16T,
    Int32T,
    Int64T,
    UInt8T,
    UInt16T,
    UInt32T,
    UInt64T,
    Struct(String),
    Enum(String),
    Data,
    String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FileInfo {
    pub name: String,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub structs: Vec<StructInfo>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub inits: Vec<InitInfo>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub deinits: Vec<DeinitInfo>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub enums: Vec<EnumInfo>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub functions: Vec<FunctionInfo>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub properties: Vec<PropertyInfo>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub protos: Vec<ProtoInfo>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ImportInfo {
    pub path: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProtoInfo(pub String);

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EnumInfo {
    pub name: String,
    pub is_public: bool,
    pub value_type: TypeVariant,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub variants: Vec<EnumVariantInfo>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EnumVariantInfo {
    pub name: String,
    pub value: i64,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub as_string: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StructInfo {
    pub name: String,
    pub is_public: bool,
    pub is_class: bool,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub fields: Vec<(String, TypeInfo)>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct InitInfo {
    pub name: String,
    pub is_public: bool,
    pub is_nullable: bool,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub params: Vec<ParamInfo>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub comments: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DeinitInfo {
    pub name: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FunctionInfo {
    pub name: String,
    pub is_public: bool,
    pub is_static: bool,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub params: Vec<ParamInfo>,
    pub return_type: TypeInfo,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub comments: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PropertyInfo {
    pub name: String,
    pub is_public: bool,
    pub return_type: TypeInfo,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub comments: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ParamInfo {
    pub name: String,
    #[serde(rename = "type")]
    pub ty: TypeInfo,
}
