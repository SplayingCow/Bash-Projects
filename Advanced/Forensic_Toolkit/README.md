# **README: Forensic Toolkit**

## **Overview**

The **Forensic Toolkit** is a Zsh-based script designed to assist in basic digital forensic investigations. It automates common forensic tasks such as analyzing file metadata, searching for specific file types, generating file hashes, and examining disk usage. This toolkit is an educational resource for learning the fundamentals of digital forensics and practicing investigative techniques in a structured and ethical manner.

---

## **Features**

1. **Analyze File Metadata**:
   - Extract detailed metadata, such as file size, modification times, type, and MIME type.

2. **Search for Specific File Types**:
   - Locate files by extension (e.g., `.jpg`, `.txt`) within a specified directory.

3. **Generate File Hashes**:
   - Create MD5 and SHA256 hashes to verify file integrity and detect tampering.

4. **Analyze Disk Usage**:
   - Inspect directories to identify large files or unusual disk usage.

5. **Comprehensive Logging**:
   - Logs all actions and results to `forensic_toolkit.log` for documentation and reporting.

---

## **Learning Objectives**

### **1. Understand File Metadata**
- Learn how metadata can provide clues about a file’s origin, purpose, and modification history.
- **Example**: Check when a suspicious file was last accessed to determine if it was recently used.

### **2. Search and Locate Evidence**
- Practice finding specific file types that may be relevant to an investigation.
- **Example**: Locate `.jpg` files in hidden directories that may contain crucial evidence.

### **3. Hashing and File Integrity**
- Explore the role of hashes (e.g., MD5, SHA256) in verifying file integrity and detecting unauthorized modifications.
- **Example**: Use hashes to ensure evidence hasn’t been altered during an investigation.

### **4. Disk Analysis**
- Learn how to examine disk usage to identify anomalies or large files.
- **Example**: Analyze a directory to find unexpectedly large files that could be hiding malicious content.

---

## **Prerequisites**

### **1. Operating System**
- Linux or Unix-based system with Zsh installed.

### **2. Required Commands**
- Ensure the following commands are available: `stat`, `file`, `find`, `md5sum`, `sha256sum`, and `du`.

### **3. Permissions**
- Some operations may require root or admin privileges, especially when analyzing system directories.

---

## **How to Use**

### **1. Save and Set Up the Script**
1. Save the script as `forensic_toolkit.zsh`.
2. Make it executable:
   ```bash
   chmod +x forensic_toolkit.zsh
   ```

### **2. Run the Script**
```bash
./forensic_toolkit.zsh
```

### **3. Follow the Menu Options**
- **Option 1**: Analyze file metadata.
- **Option 2**: Search for files by type.
- **Option 3**: Generate file hashes.
- **Option 4**: Analyze disk usage.
- **Option 5**: Exit the toolkit.

---

## **Sample Outputs**

### **Analyzing File Metadata**:
```
Enter the file path to analyze: /home/user/document.txt
Analyzing metadata for /home/user/document.txt...
File: /home/user/document.txt
Size: 2.1 KB
Modified: 2024-01-01 10:00:00
File type: ASCII text
MIME type: text/plain
```

### **Searching for Specific Files**:
```
Enter the directory to search in: /var/logs
Enter the file extension to search for: .log
Searching for .log files in /var/logs...
/var/logs/system.log
/var/logs/error.log
```

### **Generating File Hashes**:
```
Enter the file path to generate hashes: /home/user/suspicious.zip
Generating hashes for /home/user/suspicious.zip...
MD5: 5d41402abc4b2a76b9719d911017c592
SHA256: 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
```

### **Analyzing Disk Usage**:
```
Enter the directory to analyze: /home/user
Analyzing disk usage in /home/user...
4.0K    /home/user/docs
1.5G    /home/user/videos
2.5G    /home/user
```

---

## **Log File**

All actions and results are saved in `forensic_toolkit.log`. Example log entries:
```
2024-01-01 10:00:00 File metadata analyzed: /home/user/document.txt
2024-01-01 10:10:00 Search completed: Found 5 .jpg files in /home/user
2024-01-01 10:15:00 Hashes generated for /home/user/suspicious.zip
```

---

## **Real-World Applications**

1. **Evidence Collection**:
   - Analyze and document file attributes for use in investigations or court cases.

2. **Incident Response**:
   - Locate and examine files that might have been altered or introduced during a security breach.

3. **Data Forensics**:
   - Verify file integrity to ensure evidence has not been tampered with.

---

## **Potential Enhancements**

1. **Keyword Search**:
   - Add functionality to search for specific keywords or patterns within files.
   
2. **File Recovery**:
   - Integrate tools to recover deleted files for analysis.

3. **Advanced Reporting**:
   - Generate a detailed HTML or PDF report summarizing findings.

4. **Support for More Hash Algorithms**:
   - Include additional hash functions like SHA-512 for greater flexibility.

---

## **Legal and Ethical Use**

- **Authorized Use Only**:
  - This toolkit must be used only on systems you own or have explicit permission to investigate.
- **Respect Privacy**:
  - Unauthorized access to systems or files is illegal and unethical.

---

## **Conclusion**

The **Forensic Toolkit** provides a practical way to learn and practice essential digital forensic techniques. It introduces file analysis, disk examination, and hashing in a hands-on, interactive format. Whether you’re a student, researcher, or IT professional, this toolkit is a valuable resource for building foundational skills in digital forensics. Use it responsibly to deepen your knowledge and enhance your investigative capabilities!