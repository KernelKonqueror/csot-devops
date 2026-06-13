!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>" >&2
        exit 1
fi
reltardir="$1"
if [ ! -d "$reltardir" ]; then
    echo "Error: '$reltardir
' does not exist or is not a directory." >&2
    exit 1
fi


find "$reltardir" -type f -size +1M -printf "%s\t%P\n" | sort -rn

exit 0