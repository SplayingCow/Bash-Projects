# **README: Encrypted File System Simulation**

## **Overview**

The **Encrypted File System Simulation** is a Zsh-based script that provides an educational demonstration of file encryption and decryption. It allows users to securely encrypt files, decrypt them when needed, and manage encrypted files in a structured environment. This tool is ideal for understanding how encryption works and how it can protect sensitive data.

---

## **Features**

1. **Initialize Encrypted File System**:
   - Sets up directories for encrypted and decrypted files.
   - Generates a GPG key for secure encryption if one does not already exist.

2. **Encrypt Files**:
   - Allows users to encrypt files and store them securely in an encrypted directory.

3. **Decrypt Files**:
   - Provides the ability to decrypt encrypted files and store them in a decrypted directory.

4. **List Encrypted Files**:
   - Displays a list of all encrypted files stored in the encrypted directory.

5. **Exit**:
   - Exits the program gracefully.

---

## **How It Works**

### **Initialization**
- Creates directories for storing encrypted and decrypted files.
- Generates a GPG encryption key:
  - The key is used to encrypt and decrypt files.
  - The key never expires, ensuring long-term usability.

### **Encryption**
- Uses the GPG key to encrypt specified files.
- The encrypted file is stored in the `encrypted_files` directory with a `.gpg` extension.

### **Decryption**
- Decrypts specified encrypted files using the GPG key.
- The decrypted file is saved in the `decrypted_files` directory.

### **File Management**
- Lists all files in the encrypted directory, making it easy to manage and track encrypted data.

---

## **Setup Instructions**

### **1. Prerequisites**
- Install **GPG** (GNU Privacy Guard):
  ```bash
  sudo apt install gnupg
  ```

### **2. Save and Run the Script**
1. Save the script as `encrypted_file_system.zsh`.
2. Make it executable:
   ```bash
   chmod +x encrypted_file_system.zsh
   ```
3. Run the script:
   ```bash
   ./encrypted_file_system.zsh
   ```

---

## **Menu Options**

### **1. Initialize Encrypted File System**
- Creates directories and generates the encryption key if not already present.
- Example:
  ```bash
  Initializing Encrypted File System...
  Encryption key generated and saved as efs_key.gpg.
  ```

### **2. Encrypt a File**
- Prompts the user for a file path and encrypts the file.
- Example:
  ```bash
  Enter the file path to encrypt: /home/user/document.txt
  File encrypted and stored as encrypted_files/document.txt.gpg.
  ```

### **3. Decrypt a File**
- Prompts the user for the path of an encrypted file and decrypts it.
- Example:
  ```bash
  Enter the path of the encrypted file: encrypted_files/document.txt.gpg
  File decrypted and saved as decrypted_files/document.txt.
  ```

### **4. List Encrypted Files**
- Displays a list of all files in the encrypted directory.
- Example:
  ```bash
  Encrypted Files in encrypted_files:
  document.txt.gpg
  ```

### **5. Exit**
- Safely exits the program.

---

## **Educational Objectives**

1. **Understand File Encryption and Decryption**:
   - Learn how to secure sensitive data using encryption.
   - Practice decrypting files to access their original contents.

2. **Simulate an Encrypted File System**:
   - Gain hands-on experience with managing encrypted and decrypted files.

3. **Explore Key Management**:
   - Understand the role of encryption keys in securing data.

4. **Secure File Storage**:
   - Learn how to organize and manage encrypted files in a secure directory structure.

---

## **Real-World Applications**

1. **Data Privacy**:
   - Encrypt sensitive files to protect them from unauthorized access.

2. **Secure Backups**:
   - Use encryption to ensure the security of backup files stored locally or in the cloud.

3. **Compliance**:
   - Practice secure file management techniques that align with data protection regulations like GDPR and HIPAA.

---

## **Potential Enhancements**

1. **Automated Key Backup**:
   - Add functionality to securely back up the encryption key.

2. **Encrypt Entire Directories**:
   - Extend the script to encrypt and decrypt entire directories.

3. **User Authentication**:
   - Add authentication mechanisms to restrict access to the script’s functionality.

4. **Cloud Integration**:
   - Automate secure uploads and downloads of encrypted files to/from cloud storage platforms.

---

## **Considerations**

1. **Key Management**:
   - Back up the encryption key securely. Losing the key will render encrypted files inaccessible.

2. **Resource Usage**:
   - Encrypting large files may take time and consume system resources.

3. **Legal and Ethical Use**:
   - Ensure you have permission to encrypt or decrypt files. Do not use this tool for malicious purposes.

---

## **Conclusion**

The **Encrypted File System Simulation** is a powerful educational tool for understanding encryption principles and secure file management. It demonstrates how to protect sensitive data, manage encrypted files, and decrypt them when needed. This script provides a solid foundation for building more advanced secure file systems in real-world applications. Use this tool responsibly and ethically to enhance your understanding of data security.