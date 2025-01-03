#!/bin/zsh
# Backup Automation Script
# This script automates the backup process for critical directories.

# Variables
BACKUP_DIRS=("/path/to/dir1" "/path/to/dir2")  # List of directories to back up
BACKUP_DEST="/path/to/backup"  # Destination directory for backups
BACKUP_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"  # Backup file name with timestamp

# Ensure the backup destination exists
if [[ ! -d "$BACKUP_DEST" ]]; then
    echo "Creating backup destination: $BACKUP_DEST"
    mkdir -p "$BACKUP_DEST"
fi

# Create the backup
echo "Starting backup process..."
tar -czf "$BACKUP_DEST/$BACKUP_NAME" "${BACKUP_DIRS[@]}" 2>/dev/null

if [[ $? -eq 0 ]]; then
    echo "Backup successful!"
    echo "Backup saved to: $BACKUP_DEST/$BACKUP_NAME"
else
    echo "Backup failed. Please check your directories and permissions."
    exit 1
fi
