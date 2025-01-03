#!/bin/bash

shopt -s nullglob

# Check for dry-run argument
DRY_RUN=false
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
    echo "Running in dry-run mode. No files will be moved."
    shift  # Remove the dry-run argument
fi

# Get the target directory (default to current directory)
TARGET_DIR="${1:-./}"

# Validate the target directory
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Target directory does not exist: $TARGET_DIR"
    exit 1
fi

# Set log file
LOG_FILE="${TARGET_DIR%/}/file_organizer.log"
true > "$LOG_FILE"  # Safely truncate the log file
echo "File Organizer started at $(date)" >> "$LOG_FILE"

# Get the script's own name
SCRIPT_NAME=$(basename "$0")
EXCLUDED_FILES=("$SCRIPT_NAME")

# Define custom directory mappings
declare -A EXTENSION_MAP=(
    ["jpg"]="Images"
    ["png"]="Images"
    ["txt"]="TextFiles"
    ["pdf"]="Documents"
    ["mp3"]="Audio"
)

# Function to log messages
log_message() {
    local MESSAGE="$1"
    echo "$MESSAGE"
    echo "$MESSAGE" >> "$LOG_FILE"
}

# Use find to recursively process files
find "$TARGET_DIR" -type f | while read -r FILE; do
    # Skip explicitly excluded files
    BASENAME=$(basename "$FILE")
    EXCLUDED=false
    for EXCLUDED_FILE in "${EXCLUDED_FILES[@]}"; do
        if [ "$BASENAME" == "$EXCLUDED_FILE" ]; then
            EXCLUDED=true
            break
        fi
    done

    if [ "$EXCLUDED" = true ]; then
        log_message "Skipping excluded file: $BASENAME"
        continue
    fi

    # Extract the file's directory and extension
    FILE_DIR=$(dirname "$FILE")
    EXTENSION="${FILE##*.}"
    EXTENSION=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')

    # Handle files without extensions
    if [[ "$FILE" == "$EXTENSION" ]]; then
        EXTENSION="no_extension"
    fi

    # Handle hidden files with no extensions
    if [[ $BASENAME =~ ^\.[^.]+$ ]]; then
        EXTENSION="hidden_file"
    fi

    # Determine the custom directory name
    CUSTOM_DIR="${EXTENSION_MAP[$EXTENSION]:-$EXTENSION}"

    # Create the directory for the extension in the file's directory
    TARGET_SUBDIR="${FILE_DIR%/}/$CUSTOM_DIR"
    if [ "$DRY_RUN" = true ]; then
        log_message "Would create directory: $TARGET_SUBDIR"
    else
        mkdir -p "$TARGET_SUBDIR"
    fi

    # Check for duplicate files
    if [ -e "$TARGET_SUBDIR/$BASENAME" ]; then
        NEW_NAME="$(basename "$FILE" | sed "s/\(.*\)\./\1_$(date +%s)./")"
        if [ "$DRY_RUN" = true ]; then
            log_message "Would move $FILE to $TARGET_SUBDIR/$NEW_NAME (renamed due to conflict)"
        else
            mv "$FILE" "$TARGET_SUBDIR/$NEW_NAME"
            log_message "Moved $FILE to $TARGET_SUBDIR/$NEW_NAME (renamed due to conflict)"
        fi
    else
        if [ "$DRY_RUN" = true ]; then
            log_message "Would move $FILE to $TARGET_SUBDIR/$BASENAME"
        else
            mv "$FILE" "$TARGET_SUBDIR/$BASENAME"
            log_message "Moved $FILE to $TARGET_SUBDIR/$BASENAME"
        fi
    fi
done




