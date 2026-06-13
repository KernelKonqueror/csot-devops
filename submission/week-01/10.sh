#!/usr/bin/env bash
set -euo pipefail
dir="$1"
du -k "$dir" 2>/dev/null | sort -rn | head -n 10