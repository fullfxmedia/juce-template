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

for target in "$OLD_FULL_NAME" "$OLD_NAME"; do
    # Directory renaming
    find . -depth -type d -name "*$target*" | while read -r dir; do
        new_dir=$(echo "$dir" | sed "s/$target/$TARGET_NAME/g")
        mv "$dir" "$new_dir"
    done

    # File renaming
    find . -type f -name "*$target*" | while read -r file; do
        new_file=$(echo "$file" | sed "s/$target/$NEW_NAME/g")
        mv "$file" "$new_file"
    done
done

# Replace inside files
export LC_CTYPE=C
grep -rIl "$TEMPLATE_NAME" . | xargs sed -i '' "s/$TEMPLATE_NAME/$TARGET_NAME/g"
grep -rIl "$TEMPLATE_FULL_NAME" . | xargs sed -i '' "s/$TEMPLATE_FULL_NAME/$TARGET_NAME/g"

echo "Completed renaming from $TEMPLATE_NAME to $TARGET_NAME."
