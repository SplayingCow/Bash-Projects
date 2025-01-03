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

    # Move the file into the correct directory
    if [ -e "$FILE" ]; then
        mv "$FILE" "$TARGET_DIR/$EXTENSION/"
        echo "Moved $FILE to $TARGET_DIR/$EXTENSION/"
    else
        echo "File $FILE does not exist. Skipping."
    fi
done

