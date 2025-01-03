#!/bin/bash

# Target directory (current directory by default)
TARGET_DIR="./"

# Loop through all files in the directory (including hidden files)
for FILE in "$TARGET_DIR"* "$TARGET_DIR".*; do
    # Skip special directories "." and ".."
    if [ "$FILE" == "$TARGET_DIR." ] || [ "$FILE" == "$TARGET_DIR.." ]; then
        continue
    fi

    # Skip directories
    if [ -d "$FILE" ]; then
        continue
    fi

    # Extract the extension (case-insensitive)
    EXTENSION="${FILE##*.}"
    EXTENSION=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')

    # Handle files without extensions
    if [[ "$FILE" == "$EXTENSION" ]]; then
        EXTENSION="no_extension"
    fi

    # Handle hidden files with no extensions
    if [[ "$FILE" =~ ^\.[^.]+$ ]]; then
        EXTENSION="hidden_file"
    fi

    # Create the directory for the extension in the current directory
    mkdir -p "$TARGET_DIR/$EXTENSION"

    # Check for duplicate files
    if [ -e "$TARGET_DIR/$EXTENSION/$(basename "$FILE")" ]; then
        NEW_NAME="$(basename "$FILE" | sed "s/\(.*\)\./\1_$(date +%s)./")"
        mv "$FILE" "$TARGET_DIR/$EXTENSION/$NEW_NAME"
        echo "Moved $FILE to $TARGET_DIR/$EXTENSION/$NEW_NAME (renamed due to conflict)"
    else
        mv "$FILE" "$TARGET_DIR/$EXTENSION/"
        echo "Moved $FILE to $TARGET_DIR/$EXTENSION/"
    fi
done

