#!/bin/bash
# init.sh
# Usage: ./init.sh NewPluginName

if [ $# -ne 1 ]; then
    echo "Usage: $0 <NewPluginName>"
    exit 1
fi

TARGET_NAME="$1"
TEMPLATE_NAME="AudioPlugin"
TEMPLATE_FULL_NAME="AudioPluginTemplate"

# Replace in filenames
find . -type f -name "*$TEMPLATE_NAME*" | while read -r file; do
    new_file=$(echo "$file" | sed "s/$TEMPLATE_NAME/$TARGET_NAME/g")
    mv "$file" "$new_file"
done

find . -type f -name "*$TEMPLATE_FULL_NAME*" | while read -r file; do
    new_file=$(echo "$file" | sed "s/$TEMPLATE_FULL_NAME/$TARGET_NAME/g")
    mv "$file" "$new_file"
done

# Replace inside files
grep -rl "$TEMPLATE_NAME" . | xargs sed -i '' "s/$TEMPLATE_NAME/$TARGET_NAME/g"
grep -rl "$TEMPLATE_FULL_NAME" . | xargs sed -i '' "s/$TEMPLATE_FULL_NAME/$TARGET_NAME/g"

echo "Completed renaming from $TEMPLATE_NAME to $TARGET_NAME."
