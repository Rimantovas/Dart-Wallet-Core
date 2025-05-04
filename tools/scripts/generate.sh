#!/bin/zsh

check_previous_command() {
  local error_message=$1
  
  if [ $? -ne 0 ]; then
    echo "Error: $error_message"
    exit 1
  fi
}

setup_files() {
  local source_dir=$1
  local target_dir=$2
  
  echo "Setting up files from $source_dir to $target_dir"
  cp -r ../../assets/$source_dir $target_dir
  check_previous_command "Failed to copy files from $source_dir."
}

cleanup_files() {
  local dir_to_remove=$1
  
  echo "Cleaning up $dir_to_remove"
  rm -rf $dir_to_remove
  check_previous_command "Failed to clean up $dir_to_remove."
}

prompt_continue() {
  local message=$1
  echo ""
  echo "✅ $message"
  echo ""
  echo "Press Enter to continue or Ctrl+C to abort..."
  read answer
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
}

echo "🚀 Starting Code Generation Pipeline"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Store the base directory
BASE_DIR=$(pwd)

echo "🧹 Cleaning up previous generated code..."
# Clean up previous generated code
rm -rf ../../packages/dart_wallet_core_codegen/lib/src/bindings
rm -rf ../../packages/dart_wallet_core_codegen/lib/src/proto
rm -rf ../../packages/dart_wallet_core_codegen/lib/src/generated
rm -rf ../../packages/dart_wallet_core_codegen/tools/codegen-dart/manifest

prompt_continue "Cleanup completed successfully"

echo "📦 Step 1: Generating FFI bindings..."
# Step 1: Generate FFI bindings
setup_files "include/TrustWalletCore" "../../packages/dart_wallet_core_codegen/include"

# Add forward declarations
echo "📝 Adding forward declarations to headers..."
node ./add_structs_to_headers.js
check_previous_command "Failed to add forward declarations."

# Run ffigen
echo "🔧 Running ffigen..."
cd ../../packages/dart_wallet_core_codegen 
dart run ffigen
check_previous_command "Failed to create C header bindings."
cd "$BASE_DIR"

cleanup_files "../../packages/dart_wallet_core_codegen/include"

prompt_continue "FFI bindings generated successfully"

echo "📦 Step 2: Generating protobuf files..."
# Step 2: Generate protobuf files
setup_files "proto" "../../packages/dart_wallet_core_codegen/proto"
cd ../../packages/dart_wallet_core_codegen
./tools/scripts/proto_gen.sh
check_previous_command "Failed to generate protobufs."
cd "$BASE_DIR"

cleanup_files "../../packages/dart_wallet_core_codegen/proto"

prompt_continue "Protobuf files generated successfully"

echo "📦 Step 3: Generating Rust code..."
# Step 3: Generate Rust code
mkdir -p ../../packages/dart_wallet_core_codegen/tools/include/TrustWalletCore
setup_files "include/TrustWalletCore" "../../packages/dart_wallet_core_codegen/tools/include"
mkdir -p ../../packages/dart_wallet_core_codegen/tools/codegen-dart/manifest

echo "🔨 Creating manifest from Rust code..."
cd ../../packages/dart_wallet_core_codegen/tools/codegen-dart
cargo run -- create-manifest
check_previous_command "Failed to create manifest."
cd "$BASE_DIR"

prompt_continue "Manifest created successfully"

echo "🔨 Generating Dart code from Rust..."
cd ../../packages/dart_wallet_core_codegen/tools/codegen-dart
cargo run -- dart
check_previous_command "Failed to generate Dart code from Rust."
cd "$BASE_DIR"

cleanup_files "../../packages/dart_wallet_core_codegen/tools/include"
# cleanup_files "../../packages/dart_wallet_core_codegen/tools/codegen-dart/manifest"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✨ Code generation completed successfully! ✨"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
