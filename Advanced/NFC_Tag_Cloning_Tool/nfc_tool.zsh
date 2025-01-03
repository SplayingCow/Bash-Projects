#!/bin/zsh
# NFC Tag Cloning Tool
# This script reads NFC tags, saves their data, and writes it to a blank NFC tag.

# Check if required tools are installed
if ! command -v nfc-list &>/dev/null || ! command -v nfc-mfclassic &>/dev/null; then
    echo "Required tools (nfc-list and nfc-mfclassic) are not installed. Please install libnfc tools to use this script."
    exit 1
fi

# Define backup file for tag data
BACKUP_FILE="nfc_tag_backup.mfd"

# Function to read NFC tag data
read_tag() {
    echo "Place the NFC tag near the reader to read its data."
    echo "Reading NFC tag..."
    sudo nfc-mfclassic r A "$BACKUP_FILE" | tee -a nfc_tool.log
    if [[ $? -eq 0 ]]; then
        echo "Tag data successfully read and saved to $BACKUP_FILE."
    else
        echo "Failed to read NFC tag. Ensure the tag is readable and try again."
    fi
}

# Function to clone NFC tag data
clone_tag() {
    echo "Place the blank NFC tag near the reader to write data."
    echo "Cloning NFC tag..."
    if [[ -f "$BACKUP_FILE" ]]; then
        sudo nfc-mfclassic w A "$BACKUP_FILE" | tee -a nfc_tool.log
        if [[ $? -eq 0 ]]; then
            echo "Tag successfully cloned from $BACKUP_FILE."
        else
            echo "Failed to write NFC tag. Ensure the blank tag is writable and try again."
        fi
    else
        echo "Backup file $BACKUP_FILE not found. Please read a tag first."
    fi
}

# Function to list nearby NFC tags
list_tags() {
    echo "Scanning for NFC tags..."
    sudo nfc-list | tee -a nfc_tool.log
}

# Main menu
while true; do
    echo "NFC Tag Cloning Tool"
    echo "1. Scan for NFC Tags"
    echo "2. Read NFC Tag Data"
    echo "3. Clone NFC Tag Data"
    echo "4. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            list_tags
            ;;
        2)
            read_tag
            ;;
        3)
            clone_tag
            ;;
        4)
            echo "Exiting NFC Tag Cloning Tool."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
