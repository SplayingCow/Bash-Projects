#!/bin/zsh
# Forensic Toolkit
# This script performs common digital forensic tasks.

# Define log file
LOG_FILE="forensic_toolkit.log"

# Function to analyze file metadata
analyze_metadata() {
    read -r -p "Enter the file path to analyze: " file_path

    if [[ -f "$file_path" ]]; then
        echo "Analyzing metadata for $file_path..." | tee -a "$LOG_FILE"
        stat "$file_path" | tee -a "$LOG_FILE"
        echo "File type:" $(file "$file_path") | tee -a "$LOG_FILE"
        echo "MIME type:" $(file --mime-type "$file_path") | tee -a "$LOG_FILE"
    else
        echo "File not found. Please check the path and try again." | tee -a "$LOG_FILE"
    fi
}

# Function to search for specific file types
search_files() {
    read -r -p "Enter the directory to search in: " directory
    read -r -p "Enter the file extension to search for (e.g., .txt, .jpg): " extension

    if [[ -d "$directory" ]]; then
        echo "Searching for $extension files in $directory..." | tee -a "$LOG_FILE"
        find "$directory" -type f -name "*$extension" | tee -a "$LOG_FILE"
    else
        echo "Directory not found. Please check the path and try again." | tee -a "$LOG_FILE"
    fi
}

# Function to calculate file hashes
generate_hashes() {
    read -r -p "Enter the file path to generate hashes: " file_path

    if [[ -f "$file_path" ]]; then
        echo "Generating hashes for $file_path..." | tee -a "$LOG_FILE"
        echo "MD5:" $(md5sum "$file_path" | awk '{print $1}') | tee -a "$LOG_FILE"
        echo "SHA256:" $(sha256sum "$file_path" | awk '{print $1}') | tee -a "$LOG_FILE"
    else
        echo "File not found. Please check the path and try again." | tee -a "$LOG_FILE"
    fi
}

# Function to list disk usage
analyze_disk_usage() {
    read -r -p "Enter the directory to analyze: " directory

    if [[ -d "$directory" ]]; then
        echo "Analyzing disk usage in $directory..." | tee -a "$LOG_FILE"
        du -h "$directory" | tee -a "$LOG_FILE"
    else
        echo "Directory not found. Please check the path and try again." | tee -a "$LOG_FILE"
    fi
}

# Main menu
while true; do
    echo "Forensic Toolkit"
    echo "1. Analyze File Metadata"
    echo "2. Search for Specific File Types"
    echo "3. Generate File Hashes"
    echo "4. Analyze Disk Usage"
    echo "5. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            analyze_metadata
            ;;
        2)
            search_files
            ;;
        3)
            generate_hashes
            ;;
        4)
            analyze_disk_usage
            ;;
        5)
            echo "Exiting Forensic Toolkit."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
