#!/bin/bash

[ $# -eq 0 ] && { echo "Usage: $0 <TARGET_NAME>"; exit 1; }

TARGET="$1"

# Rename content in text files
find . -type f -not -path "./.git/*" -exec grep -l "AudioPlugin" {} + 2>/dev/null | \
while read file; do
    sed -i.bak "s/AudioPluginTemplate/$TARGET/g; s/AudioPlugin/$TARGET/g" "$file"
    rm "$file.bak"
done

# Rename files and directories (deepest first)
find . -depth -not -path "./.git/*" \( -name "*AudioPlugin*" -o -name "*AudioPluginTemplate*" \) | \
while read path; do
    new_path=$(echo "$path" | sed "s/AudioPluginTemplate/$TARGET/g; s/AudioPlugin/$TARGET/g")
    [ "$path" != "$new_path" ] && mv "$path" "$new_path"
done

echo "Renamed AudioPlugin* to $TARGET"