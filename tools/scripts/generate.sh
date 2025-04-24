#!/bin/zsh

# Run the Node.js script to add forward declarations
node ./add_structs_to_headers.js

# Check if the Node.js script ran successfully
if [ $? -eq 0 ]; then
  # Run ffigen if the Node.js script was successful
  cp -r ../../assets/include ../../packages/dart_wallet_core_codegen/include
  rm -rf ../../packages/dart_wallet_core_codegen/lib/bindings
  cd ../../packages/dart_wallet_core_codegen && dart run ffigen
  rm -rf ../../packages/dart_wallet_core_codegen/include
else
  echo "Error: Failed to add forward declarations."
  exit 1
fi

# Check if the bindings were generated successfully
if [ $? -eq 0 ]; then
  # Run the script to generate protobuf files
  cp -r ../../assets/proto ../../packages/dart_wallet_core_codegen/proto
  rm -rf ../../packages/dart_wallet_core_codegen/lib/proto
  ../../packages/dart_wallet_core_codegen/tools/scripts/proto_gen.sh
  rm -rf ../../packages/dart_wallet_core_codegen/proto
else
  echo "Error: Failed to add create C header bindings."
  exit 1
fi

# Check if the proto were generated successfully
if [ $? -eq 0 ]; then
  # Run rust code generator
  # cp -r ../../assets/manifest ../../packages/dart_wallet_core_codegen/tools/codegen-dart/manifest
  # rm -rf ../../packages/dart_wallet_core_codegen/lib/generated
  cd ../../packages/dart_wallet_core_codegen/tools/codegen-dart && cargo run -- dart
  # rm -rf ../../packages/dart_wallet_core_codegen/tools/codegen-dart/manifest
else
  echo "Error: Failed to generate protobufs."
  exit 1
fi
