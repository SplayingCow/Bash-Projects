# **README: NFC Tag Cloning Tool**

## **Overview**

The **NFC Tag Cloning Tool** is a Zsh-based script designed to interact with NFC tags using the **libnfc** suite. This script allows users to scan nearby NFC tags, read data from an NFC tag, and write (clone) that data to a blank NFC tag. It’s a valuable tool for educational purposes, NFC research, and testing access control systems.

---

## **Features**

1. **Scan for NFC Tags**:
   - Detects nearby NFC tags and retrieves their unique identifiers (UID) and other basic information.

2. **Read NFC Tag Data**:
   - Reads the data stored on an NFC tag and saves it to a backup file for further use.

3. **Clone NFC Tag Data**:
   - Writes the saved data from a backup file to a blank NFC tag.

4. **Logging**:
   - Logs all operations and outputs to a file (`nfc_tool.log`) for tracking and analysis.

---

## **Prerequisites**

### **1. Required Tools**
- **libnfc**:
  - The script uses `nfc-list` and `nfc-mfclassic` from the libnfc suite.
  - Install on Debian-based systems:
    ```bash
    sudo apt install libnfc-bin
    ```

### **2. Permissions**
- Root privileges are required to access the NFC reader and perform read/write operations. Run the script with `sudo`.

---

## **How to Use**

### **1. Save the Script**
- Save the script as `nfc_cloning_tool.zsh`.

### **2. Make It Executable**
```bash
chmod +x nfc_cloning_tool.zsh
```

### **3. Run the Script**
```bash
sudo ./nfc_cloning_tool.zsh
```

### **4. Follow the Menu Options**
- **Option 1**: Scan for NFC tags.
- **Option 2**: Read data from an NFC tag and save it to a file.
- **Option 3**: Clone the saved data to a blank NFC tag.

---

## **Menu Options**

### **1. Scan for NFC Tags**
- Scans for all nearby NFC tags.
- Displays the UID and basic information about each tag.

### **2. Read NFC Tag Data**
- Reads the data stored on an NFC tag.
- Saves the data to a file (`nfc_tag_backup.mfd`) for later use.
- Ensures that the tag is readable before proceeding.

### **3. Clone NFC Tag Data**
- Writes the data from the backup file (`nfc_tag_backup.mfd`) to a blank NFC tag.
- Ensures that the blank tag is writable and data integrity is maintained.

### **4. Exit**
- Safely exits the script.

---

## **Sample Outputs**

### **Scanning for NFC Tags**:
```
Scanning for NFC tags...
NFC device: PN532
ISO14443A tag:
    UID (NFCID1): 04:AB:56:CD:EF:01:23
    ATQA: 0x0400
    SAK: 0x08
```

### **Reading NFC Tag Data**:
```
Place the NFC tag near the reader to read its data.
Reading NFC tag...
Tag data successfully read and saved to nfc_tag_backup.mfd.
```

### **Cloning NFC Tag Data**:
```
Place the blank NFC tag near the reader to write data.
Cloning NFC tag...
Tag successfully cloned from nfc_tag_backup.mfd.
```

---

## **Log File (`nfc_tool.log`)**

The log file contains a record of all operations performed by the script, including timestamps and results. Example log entries:

```
2024-01-01 12:00:00 Scanned NFC tag with UID: 04:AB:56:CD:EF:01:23
2024-01-01 12:01:00 Read NFC tag data and saved to nfc_tag_backup.mfd
2024-01-01 12:02:00 Cloned NFC tag data to a blank tag
```

---

## **Educational Significance**

1. **Understanding NFC Technology**:
   - Learn how NFC tags store and transmit data.
   - Explore concepts like UID, data blocks, and memory types.

2. **Hands-On Scripting**:
   - Use Zsh scripting to automate NFC tag scanning, reading, and writing.

3. **Security Awareness**:
   - Understand potential vulnerabilities in NFC systems and how to test them responsibly.

---

## **Real-World Use Cases**

1. **NFC Testing and Research**:
   - Study how NFC tags store data and interact with readers.

2. **Access Control System Testing**:
   - Test and validate NFC-based access systems (with authorization).

3. **Educational Demonstrations**:
   - Demonstrate NFC technology and security concepts to students or professionals.

---

## **Potential Enhancements**

1. **Data Inspection**:
   - Add functionality to view and modify tag data before cloning.

2. **Tag Type Detection**:
   - Automatically detect the type of NFC tag (e.g., Mifare Classic, NTAG).

3. **Custom Authentication**:
   - Support custom keys for reading and writing protected tags.

4. **Continuous Scanning**:
   - Add a real-time scanning mode to detect new NFC tags.

---

## **Legal and Ethical Use**

- **Important**: This tool is for educational purposes and authorized testing only.
- Unauthorized reading or cloning of NFC tags is illegal and unethical.
- Always obtain explicit permission before using this tool on third-party devices or systems.

---

## **Conclusion**

The **NFC Tag Cloning Tool** is a versatile script for exploring and understanding NFC technology. It provides a hands-on way to interact with NFC tags, offering insights into their functionality and security. Use this tool responsibly to enhance your knowledge of NFC systems and contribute to their improvement.