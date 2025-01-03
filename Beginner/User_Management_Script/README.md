# README: User Management Script

## What I Learned

### Bash Scripting Basics
- **Script Structure**: I learned how to structure a bash script with functions to modularize different tasks.
- **Input Handling**: I used `read -r` to capture user input securely, avoiding unnecessary processing or interpretation of special characters.
- **Conditional Logic**: I utilized `if`, `case`, and loops to control the flow of the script based on user inputs.
- **Command Validation**: Checking for existing users with `id` and managing output redirection for error handling (`&>/dev/null`) were critical in ensuring reliability.

### User Management
- **Adding Users**: I implemented a function to create new users while ensuring no duplicates exist, promoting clean and secure user management.
- **Deleting Users**: I included a confirmation step before deleting users to prevent accidental or unauthorized account removal.
- **Listing Users**: I leveraged the `/etc/passwd` file to retrieve all usernames for audit and review purposes.

### Cybersecurity Practices
- **Account Security**: Emphasized the importance of setting strong passwords immediately after user creation to prevent unauthorized access.
- **Data Protection**: Ensured that deleting users also removes their home directories (`userdel -r`), eliminating residual sensitive data.
- **Input Validation**: Encouraged validation of all user inputs to prevent script misuse and accidental errors.

---

## What the Script Does

The script provides an interactive way to manage user accounts on a Linux system, specifically designed for administrators. It is split into three main functionalities:

### 1. Add User
- **Prompt**: Asks for the username of the new user.
- **Validation**: Checks if the user already exists.
- **Action**: Creates the user account using `sudo useradd` and reminds the administrator to set a password.

### 2. Delete User
- **Prompt**: Asks for the username of the account to be deleted.
- **Validation**: Confirms the user exists.
- **Confirmation**: Seeks explicit confirmation to avoid accidental deletions.
- **Action**: Deletes the user and their home directory using `sudo userdel -r`.

### 3. List Users
- **Action**: Retrieves and displays all usernames in the system by parsing the `/etc/passwd` file.

### 4. Exit
- **Action**: Exits the script, encouraging administrators to regularly review user accounts for security.

---

## Key Notes
- **Administrative Privileges**: The script requires `sudo` to execute commands that modify user accounts.
- **Error Handling**: The script prevents common errors, such as attempting to add an existing user or delete a non-existent one.
- **Security Focus**: Each step incorporates cybersecurity best practices to maintain a secure and well-managed user environment.

This script is a foundational tool for system administrators to ensure streamlined and secure user management.