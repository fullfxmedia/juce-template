#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <TARGET_NAME> <PLUGIN_CODE>"
  exit 1
fi

TARGET="$1"
RAW_CODE="$2"

PLUGIN_CODE=$(echo "$RAW_CODE" | tr '[:lower:]' '[:upper:]')
if ! [[ "$PLUGIN_CODE" =~ ^[A-Z]{4}$ ]]; then
  echo "Error: PLUGIN_CODE must be exactly 4 alphabetic characters (A–Z)"
  exit 1
fi

TARGET_LOWER=$(echo "$TARGET" | tr '[:upper:]' '[:lower:]')

echo "Target name : $TARGET"
echo "Target lower: $TARGET_LOWER"
echo "Plugin code : $PLUGIN_CODE"

# Replace inside files
find . -type f -not -path "./.git/*" -exec sed -i.bak \
  -e "s/AudioPluginTemplate/$TARGET/gI" \
  -e "s/AudioPlugin/$TARGET/gI" \
  -e "s/audioplugintemplate/$TARGET_LOWER/gI" \
  -e "s/AudioPluginTemplateCode/$PLUGIN_CODE/gI" \
  {} +

find . -type f -name "*.bak" -delete

# Rename files/dirs (keep case-sensitive intent here)
find . -depth -not -path "./.git/*" | while read -r path; do
  new_path=$(echo "$path" | sed \
    -e "s/AudioPluginTemplate/$TARGET/gI" \
    -e "s/AudioPlugin/$TARGET/gI" \
    -e "s/audioplugintemplate/$TARGET_LOWER/gI" \
    -e "s/PLUGIN_CODE/$PLUGIN_CODE/gI"
  )
  if [ "$path" != "$new_path" ]; then
    mv "$path" "$new_path"
  fi
done

echo "Renamed AudioPlugin* → $TARGET (and lowercased template tokens where appropriate)"
