#!/bin/bash
# File Integrity Checker Script
# This script verifies the integrity of files by comparing their current checksum with a reference checksum.

# Function to generate checksums for files
generate_checksums() {
    local directory=$1
    local output_file=$2
    echo "Generating checksums for files in directory: $directory"
    find "$directory" -type f -exec sha256sum {} \; > "$output_file"
    echo "Checksums saved to $output_file"
}

# Function to verify checksums of files
verify_checksums() {
    local checksum_file=$1
    echo "Verifying files against checksum file: $checksum_file"
    sha256sum -c "$checksum_file"
}

# Main menu
echo "File Integrity Checker"
echo "1. Generate checksums"
echo "2. Verify checksums"
read -r -p "Choose an option: " choice

case $choice in
    1)
        read -r -p "Enter directory to generate checksums for: " directory
        read -r -p "Enter file name to save checksums (e.g., checksums.txt): " output_file
        generate_checksums "$directory" "$output_file"
        ;;
    2)
        read -r -p "Enter checksum file to verify (e.g., checksums.txt): " checksum_file
        verify_checksums "$checksum_file"
        ;;
    *)
        echo "Invalid option. Exiting."
        ;;
esac
