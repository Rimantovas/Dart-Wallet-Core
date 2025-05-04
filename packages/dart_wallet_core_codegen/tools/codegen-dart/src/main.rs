use libparser::codegen::dart::RenderIntput;
use libparser::manifest::parse_dir;
use libparser::{Error, Result};
use std::fs;

use std::fs::read_to_string;
use std::io::{self, Write};
use std::path::Path;
const OUT_DIR: &str = "../../lib/src/generated";
const IN_DIR: &str = "src/codegen/dart/templates";
const MANIFEST_DIR: &str = "manifest/";
static DART_IMPORT_STATEMENTS: &[&str] = &[
    "import 'dart:core';",
    "import 'dart:ffi';",
    "import 'dart:typed_data';",
    "import 'package:dart_wallet_core_codegen/core.dart';",
    "import 'package:dart_wallet_core_codegen/misc/misc.dart';",
    "import 'package:dart_wallet_core_codegen/src/bindings/bindings.dart';",
];

fn main() -> Result<()> {
    let args: Vec<String> = std::env::args().collect();

    if args.len() < 2 {
        panic!("Invalid command");
    }

    match args[1].as_str() {
        "dart" => generate_dart_bindings(),
        "create-manifest" => create_manifest(),
        _ => Err(Error::InvalidCommand),
    }
}

fn create_manifest() -> Result<()> {
    let path = Path::new("../include/TrustWalletCore/");
    let headers = libparser::grammar::parse_headers(&path).expect("Failed to parse path");
    let file_infos = libparser::manifest::process_c_header_dir(&headers);

    std::fs::create_dir_all("manifest/").unwrap();

    for file_info in file_infos {
        if file_info.deinits.is_empty()
            && file_info.functions.is_empty()
            && file_info.properties.is_empty()
            && file_info.protos.is_empty()
            && file_info.enums.is_empty()
            && file_info.inits.is_empty()
        {
            continue;
        }
        let file_path = format!("manifest/{}.yaml", file_info.name);
        let yaml = serde_yaml::to_string(&file_info).unwrap();
        std::fs::write(&file_path, yaml.as_bytes()).unwrap();
    }

    println!("Created manifest in manifest/!");
    Ok(())
}

fn generate_dart_bindings() -> Result<()> {
    // Remove the OUT_DIR if it exists
    if Path::new(OUT_DIR).exists() {
        fs::remove_dir_all(OUT_DIR)?;
    }

    std::fs::create_dir_all(OUT_DIR)?;

    let struct_t = read_to_string(&format!("{IN_DIR}/struct.hbs"))?;
    let enum_t = read_to_string(&format!("{IN_DIR}/enum.hbs"))?;
    let ext_t = read_to_string(&format!("{IN_DIR}/extension.hbs"))?;
    let proto_t = read_to_string(&format!("{IN_DIR}/proto.hbs"))?;
    let part_init_t = read_to_string(&format!("{IN_DIR}/partial_init.hbs"))?;
    let part_func_t = read_to_string(&format!("{IN_DIR}/partial_func.hbs"))?;
    let part_prop_t = read_to_string(&format!("{IN_DIR}/partial_prop.hbs"))?;

    // Read the manifest dir, generate bindings for each entry.
    let file_infos = parse_dir(MANIFEST_DIR)?;

    for file_info in file_infos {
        let input = RenderIntput {
            file_info,
            struct_template: &struct_t,
            enum_template: &enum_t,
            extension_template: &ext_t,
            proto_template: &proto_t,
            partial_init_template: &part_init_t,
            partial_func_tempalte: &part_func_t,
            partial_prop_tempalte: &part_prop_t,
        };

        let rendered = libparser::codegen::dart::render_to_strings(input)?;

        // Enum declarations go into their own subfolder.
        if !rendered.enums.is_empty() {
            std::fs::create_dir_all(format!("{OUT_DIR}/enums"))?;
        }

        // Protobuf declarations go into their own subfolder.
        // if !rendered.protos.is_empty() {
        //     std::fs::create_dir_all(format!("{OUT_DIR}/protobuf"))?;
        // }

        for (name, rendered) in rendered.structs {
            let file_path = format!("{OUT_DIR}/{}.dart", to_snake_case(&name));
            std::fs::write(&file_path, rendered.as_bytes())?;
        }

        for (name, rendered) in rendered.enums {
            let file_path = format!("{OUT_DIR}/enums/{}.dart", to_snake_case(&name));
            std::fs::write(&file_path, rendered.as_bytes())?;
        }

        // Enum extensions.
        for (name, rendered) in rendered.extensions {
            let file_path = format!("{OUT_DIR}/{}_extension.dart", to_snake_case(&name));
            std::fs::write(&file_path, rendered.as_bytes())?;
        }

        // Protobuf messages.
        // for (name, rendered) in rendered.protos {
        //     let file_path = format!("{OUT_DIR}/protobuf/{}_proto.dart", to_snake_case(&name));
        //     std::fs::write(&file_path, rendered.as_bytes())?;
        // }
    }

    println!("Created bindings in directory 'bindings/'!");
    process_generated_bindings()?;
    Ok(())
}

fn to_snake_case(s: &str) -> String {
    let mut result = String::with_capacity(s.len());
    let mut chars = s.chars().peekable();
    let mut previous_char: Option<char> = None;

    while let Some(c) = chars.next() {
        if c.is_uppercase() {
            if let Some(prev) = previous_char {
                if prev != '_' && prev.is_lowercase() {
                    result.push('_');
                }
            }
            result.push(c.to_ascii_lowercase());
        } else {
            result.push(c);
        }
        previous_char = Some(c);
    }
    result
}

fn process_generated_bindings() -> io::Result<()> {
    // Define the directories
    // Open the generated.dart file for writing
    let mut generated_file = fs::File::create(format!("{OUT_DIR}/generated.dart"))?;

    // Strings to be prepended to generated.dart
    // Write the import statements to generated.dart
    for statement in DART_IMPORT_STATEMENTS {
        writeln!(generated_file, "{}", statement)?;
    }

    // Recursively process files in the OUT_DIR
    process_directory(Path::new(OUT_DIR), &mut generated_file, OUT_DIR)?;

    // Copy the entire OUT_DIR to the DEST_DIR
    println!("Processed and copied bindings to directory '{}'", OUT_DIR);
    Ok(())
}

fn process_directory(dir: &Path, generated_file: &mut fs::File, base_dir: &str) -> io::Result<()> {
    for entry in fs::read_dir(dir)? {
        let entry = entry?;
        let path = entry.path();

        if path.is_dir() {
            // Recursively process the subdirectory
            process_directory(&path, generated_file, base_dir)?;
        } else if path.is_file() && path.file_name().unwrap() != "generated.dart" {
            // Read the file content
            let content = fs::read_to_string(&path)?;

            // Calculate the relative path to generated.dart
            let relative_depth = path.strip_prefix(base_dir).unwrap().components().count() - 1;
            let relative_prefix = "../".repeat(relative_depth);
            let new_content = format!("part of '{}generated.dart';\n{}", relative_prefix, content);

            // Write the updated content back to the file
            fs::write(&path, new_content)?;

            // Add part statement to generated.dart
            let relative_path = path.strip_prefix(base_dir).unwrap();
            let file_name = relative_path.to_str().unwrap().replace("\\", "/");
            writeln!(generated_file, "part '{}';", file_name)?;
        }
    }
    Ok(())
}
