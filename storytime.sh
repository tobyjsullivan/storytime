#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  >&2 echo "Error: You must specify an output file."
  exit 1
fi

readonly OUT_FILE="$1"

while read line; do
  echo "$line" >> "$OUT_FILE"
  git add . && git commit -m "$line" && git push origin master
done
