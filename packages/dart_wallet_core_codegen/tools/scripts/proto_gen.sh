#!/bin/bash

readonly PROTO_DIR="./proto"
readonly OUT_DIR="./lib/proto"
readonly PROTO_FILES="${PROTO_DIR}/*.proto"

# if not install protobuf, install it by "brew install protobuf"
flutter pub global activate protoc_plugin
rm -rf ${OUT_DIR}
mkdir -p ${OUT_DIR}
protoc  -I=${PROTO_DIR} --dart_out=${OUT_DIR} ${PROTO_FILES}
