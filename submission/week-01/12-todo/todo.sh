#!/usr/bin/env bash
set -euo pipefail

FILE="${TODO_FILE:-$HOME/.todo}"
CMD="${1:-list}"
case "$CMD" in
    add)
        shift
        text="$*"
        echo "[ ] $text" >> "$FILE"
        ;;
    list)
        if [ -f "$FILE" ]; then
            awk '{ printf "%d: %s\n", NR, $0 }' "$FILE"
        fi
        ;;
    done)
        n="$2"
        if [ -f "$FILE" ] && [ -n "$n" ]; then
            sed -i "${n}s/^\[ \]/[x]/" "$FILE"
        fi
        ;;
    remove)
        n="$2"
        if [ -f "$FILE" ] && [ -n "$n" ]; then
            sed -i "${n}d" "$FILE"
        fi
        ;;
    *)
        echo "Invalid subcommand." >&2
        exit 2
        ;;
esac