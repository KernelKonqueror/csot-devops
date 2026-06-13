#!/usr/bin/env bash
set -euo pipefail
file="$1"
jq -r '.users[] | select(.active == true) | .email' "$file"