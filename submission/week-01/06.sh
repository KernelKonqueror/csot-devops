#!/usr/bin/env bash
max_attempts="$1"

delay="$2"
shift 2
if [ "$1" = "--" ]; then
    shift
fi
attempt=1
while [ "$attempt" -le "$max_attempts" ]; do
    "$@"
    rc=$?
    if [ $rc -eq 0 ]; then
        exit 0

    fi
    if [ "$attempt" -lt "$max_attempts" ]; then
        
        sleep "$delay"
        delay=$((delay * 2))
    fi
    attempt=$((attempt + 1))
done
exit $rc