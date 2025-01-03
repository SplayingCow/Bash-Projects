# README: BLE Device Logger Script

## **Overview**
The **BLE Device Logger Script** is a Zsh-based tool that scans for nearby Bluetooth Low Energy (BLE) devices and logs their details, including MAC addresses, signal strength (RSSI), and timestamps. This script is useful for identifying and monitoring BLE devices in the vicinity.

---

## **What This Script Does**
1. **Checks for Required Tools**:
   - Ensures that `hcitool` and `hcidump` (from the BlueZ suite) are installed.
2. **Scans for BLE Devices**:
   - Continuously scans for BLE devices using `hcitool`.
3. **Captures BLE Packet Data**:
   - Parses packet data with `hcidump` to extract MAC addresses and signal strength (RSSI).
4. **Logs Device Information**:
   - Saves details to a log file (`ble_device_log.txt`) in a structured format.

---

## **Prerequisites**

### **1. Required Tools**
- **BlueZ Utilities**:
  - Install the tools using your package manager:
    - **Debian/Ubuntu**:
      ```bash
      sudo apt install bluez
      ```
    - **Red Hat/CentOS**:
      ```bash
      sudo yum install bluez
      ```

### **2. Permissions**
- The script requires root privileges to scan BLE devices. Run it with `sudo`.

---

## **How to Use**

1. **Save the Script**:
   - Save the script as `ble_device_logger.zsh`.

2. **Make It Executable**:
   ```bash
   chmod +x ble_device_logger.zsh
   ```

3. **Run the Script**:
   ```bash
   sudo ./ble_device_logger.zsh
   ```

4. **Stop the Script**:
   - Press `Ctrl+C` to stop the scan.

5. **View the Log File**:
   - The device details are saved in `ble_device_log.txt` in the script's directory.

---

## **Sample Output**

### **Console Output**:
```
Starting BLE scan... Press Ctrl+C to stop.
Logging BLE devices to ble_device_log.txt.
Logged: 2024-01-01 12:34:56, AA:BB:CC:DD:EE:FF, -65
Logged: 2024-01-01 12:34:57, 11:22:33:44:55:66, -75
```

### **Log File (`ble_device_log.txt`)**:
```
Timestamp, MAC Address, RSSI, Name
2024-01-01 12:34:56, AA:BB:CC:DD:EE:FF, -65, Unknown
2024-01-01 12:34:57, 11:22:33:44:55:66, -75, Unknown
```

---

## **Key Features**

1. **Continuous Scanning**:
   - Continuously scans for BLE devices and updates the log file in real-time.

2. **Detailed Logging**:
   - Captures MAC addresses, RSSI (signal strength), and timestamps.

3. **Easy-to-Read Log File**:
   - Outputs device data in CSV format for easy analysis or import into other tools.

---

## **Real-Life Use Cases**

1. **Device Inventory**:
   - Monitor and log nearby BLE devices, such as fitness trackers, smartwatches, or IoT devices.

2. **Signal Strength Analysis**:
   - Analyze RSSI to determine device proximity and signal quality.

3. **IoT Device Monitoring**:
   - Identify active BLE devices in a specific area for troubleshooting or inventory management.

4. **Security Auditing**:
   - Detect unauthorized or unexpected BLE devices in a secure environment.

---

## **Troubleshooting**

1. **`hcitool` or `hcidump` Not Found**:
   - Ensure BlueZ is installed:
     ```bash
     sudo apt install bluez
     ```

2. **No Devices Detected**:
   - Check if your Bluetooth adapter is active:
     ```bash
     hciconfig
     ```
   - Enable the adapter if necessary:
     ```bash
     sudo hciconfig hci0 up
     ```

3. **Permission Errors**:
   - Run the script with `sudo`:
     ```bash
     sudo ./ble_device_logger.zsh
     ```

4. **Interrupted Scans**:
   - If the scan does not stop cleanly, manually terminate the `hcitool` process:
     ```bash
     sudo killall hcitool
     ```

---

## **Potential Enhancements**

1. **Device Name Resolution**:
   - Extend the script to resolve device names using `bluetoothctl`.

2. **Filter Devices**:
   - Add options to filter specific devices by MAC address or RSSI thresholds.

3. **Export to Database**:
   - Save the logged data into a database for advanced analysis and reporting.

4. **Alerts**:
   - Notify the user when specific BLE devices are detected.

---

## **License**
This script is provided "as-is" for educational and personal use. Ensure compliance with local regulations regarding BLE device scanning.

---

Let me know if you’d like additional features or further refinements!