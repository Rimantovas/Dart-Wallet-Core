#!/bin/bash

readonly PROTO_DIR="./proto"
readonly OUT_DIR="./lib/src/proto"
readonly PROTO_FILES="${PROTO_DIR}/*.proto"

# if not install protobuf, install it by "brew install protobuf"
# using 22.1.0 because later versions produce errors
flutter pub global activate protoc_plugin 22.1.0
rm -rf ${OUT_DIR}
mkdir -p ${OUT_DIR}
protoc  -I=${PROTO_DIR} --dart_out=${OUT_DIR} ${PROTO_FILES}