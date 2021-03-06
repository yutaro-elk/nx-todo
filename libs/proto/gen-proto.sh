#!/usr/bin/env bash

proto_dirs=$(find ./src/proto -path -prune -o -name '*.proto' -print0 | xargs -0 -n1 dirname | sort | uniq)
proto_files=()

for dir in $proto_dirs; do
  proto_files=("${proto_files[@]} $(find "${dir}" -maxdepth 1 -name '*.proto')")
done

npx pbjs \
  -o ./src/proto.js \
  -t static-module \
  -w es6 \
  --es6 \
  --no-create \
  --force-number \
  ${proto_files[@]}
  # --proto_path=./src/proto/thirdparty/ \
  # --keep-case \
  # --plugin=protoc-gen-firebase_rules=/usr/local/bin/protoc-gen-firebase_rules \
  # --firebase_rules_out=../firestore/proto.rules \

npx pbts \
  -o ./src/proto.d.ts \
  ./src/proto.js
