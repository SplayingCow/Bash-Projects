# **README: Disk Usage Alert Script**

## **Overview**

The **Disk Usage Alert Script** is a Zsh-based utility designed to monitor disk usage and send alerts when a specified usage threshold is exceeded. It is a simple yet effective tool for system administrators and users to ensure that their storage systems do not run out of space unexpectedly. The script also provides an interactive menu for checking and displaying disk usage.

---

## **Features**

1. **Disk Usage Monitoring**:
   - Checks all mounted filesystems for usage above a predefined threshold.
2. **Customizable Threshold**:
   - Default threshold is set to 80% but can be modified within the script.
3. **Alert Logging**:
   - Logs alerts with timestamps in a log file (`disk_usage_alert.log`).
4. **Interactive Menu**:
   - Provides options to check disk usage, display current disk usage, and exit the script.

---

## **Prerequisites**

### **1. Zsh Shell**
- The script is written for the Zsh shell. Ensure Zsh is installed on your system:
  ```bash
  sudo apt install zsh  # On Debian/Ubuntu
  sudo yum install zsh  # On Red Hat/CentOS
  ```

### **2. Permissions**
- No special permissions are required to run the script unless accessing restricted filesystems.

---

## **How to Use**

### **1. Save the Script**
- Save the script as `disk_usage_alert.zsh`.

### **2. Make It Executable**
```bash
chmod +x disk_usage_alert.zsh
```

### **3. Run the Script**
```bash
./disk_usage_alert.zsh
```

### **4. Follow the Menu Options**
- **Option 1**: Check disk usage and generate alerts for filesystems exceeding the threshold.
- **Option 2**: Display current disk usage without triggering alerts.
- **Option 3**: Exit the script.

---

## **Sample Outputs**

### **Option 1: Check Disk Usage**
```
Checking disk usage...
2024-01-01 12:34:56 ALERT: / is at 85% usage!
2024-01-01 12:34:56 ALERT: /data is at 90% usage!
```

### **Option 2: Display Disk Usage**
```
Current Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   40G   10G  80% /
/dev/sdb1       100G   90G   10G  90% /data
```

### **Log File (`disk_usage_alert.log`)**:
```
2024-01-01 12:34:56 ALERT: / is at 85% usage!
2024-01-01 12:34:56 ALERT: /data is at 90% usage!
```

---

## **Customization**

1. **Set a Custom Threshold**:
   - Edit the `THRESHOLD` variable in the script to set your desired usage limit:
     ```zsh
     THRESHOLD=90
     ```

2. **Change the Log File Location**:
   - Modify the `LOG_FILE` variable to specify a different log file:
     ```zsh
     LOG_FILE="/path/to/your/logfile.log"
     ```

---

## **Key Features and Benefits**

1. **Prevents Storage Issues**:
   - Proactively alerts users to potential disk space problems.
2. **Customizable and Flexible**:
   - Easily adjust the threshold and log file location to suit your needs.
3. **Interactive and User-Friendly**:
   - Provides a simple menu for checking and displaying disk usage.
4. **Automated Logging**:
   - Keeps a record of alerts for future reference and troubleshooting.

---

## **Real-World Use Cases**

1. **Server Monitoring**:
   - Monitor disk usage on critical servers to avoid downtime due to full storage.
2. **Home NAS Management**:
   - Track storage usage on network-attached storage devices.
3. **System Administration**:
   - Automate regular checks for overutilized filesystems.
4. **Log Analysis**:
   - Use the generated logs to identify storage trends over time.

---

## **Potential Enhancements**

1. **Email or SMS Alerts**:
   - Send notifications to the user when disk usage exceeds the threshold.
2. **Continuous Monitoring**:
   - Run the script as a background process with periodic checks.
3. **Filesystem Exclusions**:
   - Add options to exclude specific filesystems (e.g., temporary or backup partitions).
4. **Graphical Reports**:
   - Integrate with visualization tools to provide disk usage graphs.
5. **Threshold Per Filesystem**:
   - Allow users to set different thresholds for different partitions.

---

## **Troubleshooting**

1. **No Alerts Generated**:
   - Verify the `THRESHOLD` value is lower than the actual disk usage.
2. **Command Not Found**:
   - Ensure the `df` command is installed (standard on most Linux distributions).
3. **Permission Denied**:
   - Ensure the script has execute permissions:
     ```bash
     chmod +x disk_usage_alert.zsh
     ```

---

## **License**
This script is provided "as-is" for educational and personal use. Modify and redistribute freely, but use at your own risk.

---

Use the **Disk Usage Alert Script** to proactively manage your storage systems and avoid disk space issues before they become critical!