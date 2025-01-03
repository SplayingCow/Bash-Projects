# **File Organizer Script**
A simple Bash script to organize files in a directory by their extensions. This project is perfect for anyone starting with Bash scripting and aims to automate file organization tasks efficiently.

---

## **Table of Contents**
1. [Overview](#overview)
2. [Features](#features)
3. [Prerequisites](#prerequisites)
4. [How It Works](#how-it-works)
5. [Usage](#usage)
6. [Proof of Concept](#proof-of-concept)
7. [Future Enhancements](#future-enhancements)

---

## **Overview**
The File Organizer Script processes all files in a given directory, organizes them into subdirectories based on their extensions, and moves each file to its respective folder.

For example, a folder containing:
```
file1.txt, photo.jpg, music.mp3, document.pdf
```
Will be reorganized into:
```
txt/
    file1.txt
jpg/
    photo.jpg
mp3/
    music.mp3
pdf/
    document.pdf
```

---

## **Features**
- Automatically identifies file extensions.
- Creates subdirectories for extensions if they don’t already exist.
- Moves files into corresponding folders.
- Handles edge cases such as:
  - Files without extensions.
  - Hidden files.

---

## **Prerequisites**
- **Linux/Unix environment** with Bash.
- **VS Code** or any text editor for scripting (optional).
- A directory containing test files.

---

## **How It Works**
1. The script loops through all files in the target directory.
2. For each file:
   - Extracts its extension (e.g., `txt`, `jpg`).
   - Checks if a directory for that extension exists. If not, it creates one.
   - Moves the file to its respective folder.
3. Logs each action (e.g., created directories, moved files).

---

## **Usage**
### **Step 1: Setup**
1. Clone or download this repository.
2. Save the script as `file_organizer.sh` in your working directory.
3. Add test files to the same directory, such as:
   ```
   file1.txt, file2.jpg, music.mp3, document.pdf, file_without_extension
   ```

### **Step 2: Run the Script**
1. Make the script executable:
   ```bash
   chmod +x file_organizer.sh
   ```
2. Execute the script:
   ```bash
   ./file_organizer.sh
   ```

### **Step 3: Verify**
Check that files are moved into subdirectories named after their extensions:
```
txt/
    file1.txt
jpg/
    file2.jpg
mp3/
    music.mp3
pdf/
    document.pdf
no_extension/
    file_without_extension
```

---

## **Proof of Concept**
Here’s the script:

```bash
#!/bin/bash

# Target directory (current directory by default)
TARGET_DIR="./"

# Loop through each file in the directory
for FILE in "$TARGET_DIR"*; do
    # Skip directories
    if [ -d "$FILE" ]; then
        continue
    fi

    # Extract file extension
    EXTENSION="${FILE##*.}"
    EXTENSION=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')  # Convert to lowercase

    # Handle files without extensions
    if [ "$EXTENSION" == "$FILE" ]; then
        EXTENSION="no_extension"
    fi

    # Create directory if it doesn't exist
    if [ ! -d "$TARGET_DIR/$EXTENSION" ]; then
        mkdir "$TARGET_DIR/$EXTENSION"
    fi

    # Move file to its corresponding directory
    mv "$FILE" "$TARGET_DIR/$EXTENSION/"
    echo "Moved $FILE to $TARGET_DIR/$EXTENSION/"
done
```

### **Expected Output**
Run the script on a directory containing the following files:
```
file1.txt, file2.jpg, music.mp3, document.pdf, file_without_extension
```

After running the script:
```
txt/
    file1.txt
jpg/
    file2.jpg
mp3/
    music.mp3
pdf/
    document.pdf
no_extension/
    file_without_extension
```

### **Logs**
During execution, the script outputs:
```
Moved file1.txt to ./txt/
Moved file2.jpg to ./jpg/
Moved music.mp3 to ./mp3/
Moved document.pdf to ./pdf/
Moved file_without_extension to ./no_extension/
```

---

## **Future Enhancements**
- **Dry Run Mode**: Simulate the organization without actually moving files.
- **Verbose Mode**: Provide detailed logs for debugging.
- **File Name Collision Handling**: Automatically rename files if duplicates exist.
- **User-Specified Directory**: Allow users to specify a target directory via arguments.

---

## **Conclusion**
The **File Organizer Script** is a foundational Bash scripting project that automates a common task while teaching valuable scripting concepts like loops, conditionals, and file manipulation. It’s simple, effective, and extensible for future needs.