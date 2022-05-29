#!/bin/bash
# https://github.com/microsoft/TypeScript/issues/32063#issuecomment-916071942
PATTERN="*.*json"
DECL_POSTFIX=".d.ts"

find . -type f -iname "$PATTERN$DECL_POSTFIX" -exec rm {} \;
JSONS=($(find ./abis -type f -iname "$PATTERN"))


for file in "${JSONS[@]}"
do
  text=$(cat $file | jq -sR .)
  length=${#text}-2
  git check-ignore --quiet "$file" ||\
  printf "/** Generated with \`./json-d-ts.sh\` */\n/* eslint-disable */\ndeclare const data: $(echo ${text:1:$length})\nexport = data" > "$file.d.ts"
done