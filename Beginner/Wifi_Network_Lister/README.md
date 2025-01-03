# README: Wi-Fi Network Lister Script

## **Overview**
This script, written in Zsh, scans and lists all available Wi-Fi networks on a Linux system. It utilizes either the `nmcli` or `iwlist` tool, depending on availability, to display network information such as SSID and signal strength.

---

## **What This Script Does**
1. **Detects Available Tools**: 
   - Checks if `nmcli` (from `NetworkManager`) or `iwlist` (from `wireless-tools`) is installed and available.
2. **Lists Wi-Fi Networks**:
   - If `nmcli` is available, it displays detailed Wi-Fi network information.
   - If `iwlist` is available, it provides a simplified list of SSIDs and signal strengths.
3. **Fallback Mechanism**:
   - If neither tool is available, the script informs the user and exits.

---

## **Educational Points**

### **1. Tool Detection (`command -v`)**
- **What is it?**
  - The script uses `command -v <tool>` to check if a tool (e.g., `nmcli` or `iwlist`) is installed and accessible in the system’s PATH.
- **Why is it important?**
  - Ensures the script dynamically adapts to the tools available on the system.
- **Example**:
  ```bash
  if command -v nmcli &>/dev/null; then
      echo "nmcli is installed"
  fi
  ```

### **2. Using `nmcli`**
- **What is it?**
  - A command-line tool for managing and displaying network configurations provided by `NetworkManager`.
- **Why is it important?**
  - Displays detailed Wi-Fi information, including SSID, signal strength, channel, and security type.
- **Command Used in the Script**:
  ```bash
  nmcli dev wifi list
  ```

### **3. Using `iwlist`**
- **What is it?**
  - A legacy tool from `wireless-tools` for scanning and managing Wi-Fi networks.
- **Why is it important?**
  - Still useful for systems without `NetworkManager`.
- **Command Used in the Script**:
  ```bash
  sudo iwlist scan
  ```

### **4. Text Processing with `awk`, `grep`, and `sed`**
- **`awk`**:
  - Extracts specific fields of information from the tool’s output.
  - Example:
    ```bash
    awk 'NR==1 || $1!~/^--/ {print $0}'
    ```
    - Keeps the header line or rows where the first column isn’t a separator (`--`).
- **`grep`**:
  - Filters lines containing specific patterns (e.g., `ESSID` or `Signal level`).
- **`sed`**:
  - Cleans up the output by removing unwanted characters, such as double quotes.

### **5. Fallback and Error Handling**
- **Why is it included?**
  - To provide meaningful feedback if required tools (`nmcli` or `iwlist`) are missing.
- **Example**:
  ```bash
  echo "Neither nmcli nor iwlist is available. Please install one of them to use this script."
  ```

---

## **Prerequisites**

### **1. Required Tools**
- **`nmcli`**:
  - Part of the `NetworkManager` package.
  - Install it with:
    ```bash
    sudo apt install network-manager  # Debian/Ubuntu
    sudo yum install NetworkManager   # Red Hat/CentOS
    ```
- **`iwlist`**:
  - Part of the `wireless-tools` package.
  - Install it with:
    ```bash
    sudo apt install wireless-tools  # Debian/Ubuntu
    sudo yum install wireless-tools  # Red Hat/CentOS
    ```

### **2. Permissions**
- Running `iwlist` may require `sudo` privileges.

---

## **How to Use**
1. Save the script to a file, e.g., `wifi_network_lister.zsh`.
2. Make it executable:
   ```zsh
   chmod +x wifi_network_lister.zsh
   ```
3. Run the script:
   ```zsh
   ./wifi_network_lister.zsh
   ```
4. The script will:
   - Detect the available tool (`nmcli` or `iwlist`).
   - List nearby Wi-Fi networks.
   - Notify you if neither tool is installed.

---

## **Example Output**

### **Using `nmcli`**:
```
Listing Wi-Fi networks using nmcli:
SSID              MODE   CHAN  RATE        SIGNAL  BARS  SECURITY
Home_Network      Infra  6     195 Mbit/s  78      ▂▄▆_  WPA2
Guest_Network     Infra  11    130 Mbit/s  60      ▂▄__  WPA
```

### **Using `iwlist`**:
```
Listing Wi-Fi networks using iwlist:
SSID: Home_Network
Signal: -65 dBm
SSID: Guest_Network
Signal: -80 dBm
```

---

## **Why It’s Important**
1. **Dynamic Adaptability**:
   - Detects and uses whichever tool is available (`nmcli` or `iwlist`), making it versatile across different systems.
2. **Wi-Fi Management**:
   - Provides a quick way to view Wi-Fi networks and their details, aiding in troubleshooting and network selection.
3. **Learning Opportunity**:
   - Demonstrates how to combine shell scripting, tool detection, and text processing for a practical use case.

---

## **Potential Enhancements**
1. **Add Signal Strength Filtering**:
   - Only display networks with a signal strength above a certain threshold.
2. **Sort by Signal Strength**:
   - Sort the output by signal strength for easier comparison.
3. **Integration with Connection Tools**:
   - Allow the user to connect to a selected network directly from the script.

