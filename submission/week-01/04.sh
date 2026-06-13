#!/usr/bin/env bash
set -euo pipefail
dir="$1"
find "$dir" -type f -name '*.txt' -print0 | while IFS= read -r -d '' file; do
    mv "$file" "${file%.txt}.md"
done