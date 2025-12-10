#!/bin/bash

[ $# -eq 0 ] && { echo "Usage: $0 <TARGET_NAME>"; exit 1; }

TARGET="$1"

# Case-insensitive replace in files
find . -type f -not -path "./.git/*" -exec sed -i.bak \
    -e "s/AudioPluginTemplate/$TARGET/gI" \
    -e "s/AudioPlugin/$TARGET/gI" {} +

find . -type f -name "*.bak" -delete

# Rename files and directories (case-insensitive)
find . -depth -not -path "./.git/*" | \
while read path; do
    new_path=$(echo "$path" |
        sed -e "s/AudioPluginTemplate/$TARGET/gI" \
            -e "s/AudioPlugin/$TARGET/gI")
    if [ "$path" != "$new_path" ]; then
        mv "$path" "$new_path"
    fi
done

echo "Renamed AudioPlugin* (all case variants) to $TARGET"
