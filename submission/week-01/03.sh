#!/usr/bin/env bash
set -euo pipefail
dir="$1"
find "$dir" -type f -print0 | xargs -0 sed -i 's/\t/    /g'