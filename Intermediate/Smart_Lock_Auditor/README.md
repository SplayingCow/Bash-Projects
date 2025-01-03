# **README: Smart Lock Authentication Auditor**

## **Overview**
The **Smart Lock Authentication Auditor** is a Zsh-based script designed to monitor and analyze Bluetooth Low Energy (BLE) communication between a smart lock and its paired device (e.g., smartphone or key fob). This script uses tools from the BlueZ suite (`hcitool` and `hcidump`) to scan for nearby BLE devices and log communication events for auditing purposes.

---

## **Features**

1. **Scan for BLE Devices**:
   - Identifies all nearby BLE devices and logs their MAC addresses.
2. **Monitor Smart Lock Communication**:
   - Captures and logs BLE communication packets between the smart lock and paired devices.
3. **Detailed Logs**:
   - Records communication events with timestamps, MAC addresses, and packet data for analysis.

---

## **Prerequisites**

### **1. Required Tools**
- **BlueZ**:
  - Includes `hcitool` and `hcidump` for BLE scanning and packet capturing.
  - Install on Debian-based systems:
    ```bash
    sudo apt install bluez
    ```

### **2. Permissions**
- Root privileges are required to access BLE hardware and capture packets.
- Run the script with `sudo`.

---

## **How to Use**

### **1. Save the Script**
- Save the script as `smart_lock_auditor.zsh`.

### **2. Make It Executable**
```bash
chmod +x smart_lock_auditor.zsh
```

### **3. Run the Script**
```bash
sudo ./smart_lock_auditor.zsh
```

### **4. Follow the Menu Options**
- **Option 1**: Scan for BLE devices.
  - Displays all nearby BLE devices and their MAC addresses.
- **Option 2**: Monitor a specific smart lock.
  - Enter the MAC address of the smart lock to start monitoring communication.
- **Option 3**: Exit the script.

### **5. Stop Monitoring**
- Press `Ctrl+C` to stop monitoring BLE communication.

---

## **Sample Outputs**

### **Console Output (Scanning BLE Devices)**:
```
Scanning for nearby BLE devices...
Scan complete. Devices found:
AA:BB:CC:DD:EE:FF (Smart Lock)
11:22:33:44:55:66 (Phone)
```

### **Console Output (Monitoring Communication)**:
```
Monitoring BLE communication with AA:BB:CC:DD:EE:FF... Press Ctrl+C to stop.
Logged: 2024-01-01 12:34:56, AA:BB:CC:DD:EE:FF, HCI Event Packet Data
```

### **Log File (`smart_lock_audit_log.txt`)**:
```
Timestamp, MAC Address, Data
2024-01-01 12:34:56, AA:BB:CC:DD:EE:FF, HCI Event Packet Data
2024-01-01 12:34:57, AA:BB:CC:DD:EE:FF, HCI Event Packet Data
```

---

## **Key Use Cases**

1. **Authentication Monitoring**:
   - Audit communication events to ensure the smart lock is only interacting with authorized devices.

2. **Troubleshooting**:
   - Identify connectivity issues between the smart lock and paired devices.

3. **Security Auditing**:
   - Detect suspicious activity, such as unauthorized access attempts or replay attacks.

4. **Learning and Research**:
   - Explore BLE communication protocols and understand how smart locks authenticate devices.

---

## **Educational Value**

1. **Understanding BLE Communication**:
   - Learn how devices like smart locks use BLE for authentication and data exchange.

2. **Hands-On Scripting**:
   - Gain experience with Zsh scripting and tools like `hcitool` and `hcidump`.

3. **Cybersecurity Insights**:
   - Discover potential vulnerabilities in BLE-based smart locks and how to monitor for threats.

---

## **Potential Enhancements**

1. **Packet Decoding**:
   - Add functionality to parse BLE packets and extract authentication details.

2. **Filtering**:
   - Filter out irrelevant devices during scanning to focus only on smart locks.

3. **Real-Time Alerts**:
   - Notify the user of suspicious or unauthorized activity on the BLE network.

4. **Logging to a Database**:
   - Save logs to a database for advanced analysis and long-term storage.

5. **Integration with Visualization Tools**:
   - Display BLE communication patterns in a graphical format for better understanding.

---

## **Troubleshooting**

1. **Tools Not Found**:
   - Ensure BlueZ is installed:
     ```bash
     sudo apt install bluez
     ```

2. **No Devices Detected**:
   - Verify that the Bluetooth adapter is active:
     ```bash
     hciconfig
     ```
   - Enable the adapter if necessary:
     ```bash
     sudo hciconfig hci0 up
     ```

3. **Permission Denied**:
   - Run the script with `sudo`.

4. **Incomplete Logs**:
   - Ensure the Bluetooth adapter is close enough to the smart lock to capture all communication.

---

## **Conclusion**

The **Smart Lock Authentication Auditor** is a valuable tool for monitoring and analyzing BLE communication between smart locks and paired devices. It’s an excellent resource for auditing authentication events, identifying potential vulnerabilities, and learning about BLE communication protocols. Use this script to ensure secure and reliable operation of your BLE-based smart locks!