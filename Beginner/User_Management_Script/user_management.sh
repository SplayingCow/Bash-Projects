#!/bin/bash
# User Management Script
# Designed for Bash Shell (/bin/bash) with security and reliability in mind.

# Function to add a new user
add_user() {
    # Prompt for username
    read -r -p "Enter username to add: " username

    # Check if user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Avoid duplicate users to maintain security."
    else
        # Create a new user
        sudo useradd "$username"
        echo "User '$username' has been added."
        echo "Remember to set a strong password for '$username'."
        echo "Use: sudo passwd $username"

        # Cybersecurity Note:
        # Never leave a new account without a password.
        # Enforcing strong passwords prevents brute-force attacks.
    fi
}

# Function to delete an existing user
delete_user() {
    # Prompt for username
    read -r -p "Enter username to delete: " username

    # Check if user exists
    if id "$username" &>/dev/null; then
        # Confirm deletion to avoid accidental removals
        read -r -p "Are you sure you want to delete '$username'? This cannot be undone. (y/n): " confirm

        if [[ $confirm == "y" ]]; then
            # Use `userdel -r` to remove the user and their home directory
            sudo userdel -r "$username"
            echo "User '$username' has been deleted."

            # Cybersecurity Note:
            # Removing the user's home directory ensures no sensitive data remains.
        else
            echo "User deletion canceled."
        fi
    else
        echo "User '$username' does not exist. Avoid deletion attempts on non-existent users to prevent errors."
    fi
}

# Function to list all users
list_users() {
    # Cybersecurity Note:
    # List users to identify anomalies, like unauthorized accounts or old accounts that should be removed.
    echo "Listing all system users:"
    cut -d: -f1 /etc/passwd
}

# Main menu
while true; do
    # Provide admin with a menu for user management tasks
    echo "User Management Script"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Exit"
    read -r -p "Choose an option: " choice

    # Cybersecurity Note:
    # Always validate user input in scripts to avoid errors or malicious input.
    case $choice in
        1) add_user ;;  # Call function to add a user
        2) delete_user ;;  # Call function to delete a user
        3) list_users ;;  # Call function to list all users
        4) 
            echo "Exiting... Be sure to review user accounts regularly to maintain security."
            exit 0 ;;  # Exit the script
        *) 
            # Handle invalid input
            echo "Invalid option. Please choose a valid action (1-4)."
            ;;
    esac
done

