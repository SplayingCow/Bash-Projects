#!/bin/zsh
# Encrypted File System Simulation
# Educational script for encrypting and decrypting files and directories.

# Define paths
ENCRYPTED_DIR="encrypted_files"
DECRYPTED_DIR="decrypted_files"
KEY_FILE="efs_key.gpg"

# Initialize the encrypted file system
initialize_efs() {
    echo "Initializing Encrypted File System..."
    mkdir -p "$ENCRYPTED_DIR" "$DECRYPTED_DIR"
    if [[ ! -f $KEY_FILE ]]; then
        echo "Generating encryption key..."
        gpg --gen-key --batch <<EOF
Key-Type: default
Key-Length: 2048
Subkey-Type: default
Name-Real: EFS_User
Name-Comment: EFS Key
Expire-Date: 0
EOF
        echo "Encryption key generated and saved as $KEY_FILE."
    else
        echo "Encryption key already exists."
    fi
    echo "Encrypted File System initialized."
}

# Encrypt a file
encrypt_file() {
    read -r "file_path?Enter the file path to encrypt: "
    if [[ ! -f "$file_path" ]]; then
        echo "Error: File not found."
        return
    fi

    file_name=$(basename "$file_path")
    gpg --output "$ENCRYPTED_DIR/$file_name.gpg" --encrypt --recipient "EFS_User" "$file_path"
    echo "File encrypted and stored as $ENCRYPTED_DIR/$file_name.gpg."
}

# Decrypt a file
decrypt_file() {
    read -r "encrypted_file?Enter the path of the encrypted file: "
    if [[ ! -f "$encrypted_file" ]]; then
        echo "Error: Encrypted file not found."
        return
    fi

    file_name=$(basename "$encrypted_file" .gpg)
    gpg --output "$DECRYPTED_DIR/$file_name" --decrypt "$encrypted_file"
    echo "File decrypted and saved as $DECRYPTED_DIR/$file_name."
}

# List encrypted files
list_encrypted_files() {
    echo "Encrypted Files in $ENCRYPTED_DIR:"
    ls -1 "$ENCRYPTED_DIR" 2>/dev/null || echo "No encrypted files found."
}

# Main menu
while true; do
    echo "Encrypted File System Simulation"
    echo "1. Initialize Encrypted File System"
    echo "2. Encrypt a File"
    echo "3. Decrypt a File"
    echo "4. List Encrypted Files"
    echo "5. Exit"
    read -r "choice?Choose an option: "

    case $choice in
        1)
            initialize_efs
            ;;
        2)
            encrypt_file
            ;;
        3)
            decrypt_file
            ;;
        4)
            list_encrypted_files
            ;;
        5)
            echo "Exiting Encrypted File System Simulation."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
