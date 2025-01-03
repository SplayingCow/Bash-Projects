# Process Monitor Script

## Overview
The **Process Monitor Script** is a Bash utility designed to monitor a specific process on a Linux system. It continuously checks whether a specified process is running and notifies the user if the process starts or stops. This tool is useful for system administrators or users who need to track the state of critical processes.

---

## Features
- **Real-Time Monitoring**: Continuously monitors the state of a specified process.
- **Start/Stop Notifications**: Notifies when the process starts or stops.
- **Lightweight Operation**: Minimal resource usage with a configurable delay between checks.

---

## Prerequisites
- A Linux system with Bash installed.
- Basic knowledge of process names (as displayed in commands like `ps` or `top`).
- Optional: Root privileges if monitoring processes owned by other users.

---

## Usage

### 1. Download and Set Up
1. Save the script to a file, e.g., `process_monitor.sh`.
2. Make it executable by running:
   ```bash
   chmod +x process_monitor.sh
   ```

### 2. Run the Script
Execute the script from the terminal:
```bash
./process_monitor.sh
```

### 3. Input the Process Name
When prompted, enter the name of the process you want to monitor. For example, if you want to monitor the `nginx` process, type `nginx`.

### 4. Notifications
- If the process starts: The script displays:
  ```
  Process 'nginx' has started.
  ```
- If the process stops: The script displays:
  ```
  Process 'nginx' has stopped.
  ```

---

## Configuration
### Monitoring Interval
- The script checks the process status every 5 seconds by default.
- To adjust the interval, modify the `sleep 5` line in the script:
  ```bash
  sleep <interval_in_seconds>
  ```

---

## Example Scenarios
### Monitoring a Web Server
- To monitor an `nginx` web server, run the script and enter `nginx` as the process name.

### Tracking a Browser
- To check if a browser (e.g., `firefox`) is running, enter `firefox` as the process name.

---

## Future Enhancements
- **Email Notifications**: Send alerts when the process state changes.
- **Logging**: Record notifications to a file for auditing purposes.
- **Dynamic Input**: Allow users to specify monitoring intervals interactively.

---

## Troubleshooting
1. **"Command not found: pgrep"**
   - Ensure the `pgrep` command is installed. Install it using:
     ```bash
     sudo apt install procps  # For Debian/Ubuntu
     sudo yum install procps  # For Red Hat/CentOS
     ```

2. **"Permission Denied" Error**
   - Make sure the script has executable permissions:
     ```bash
     chmod +x process_monitor.sh
     ```

3. **Monitoring Fails for Another User's Process**
   - Run the script with `sudo` to monitor processes owned by other users:
     ```bash
     sudo ./process_monitor.sh
     ```

---

## Notes
- Use the script responsibly, especially when monitoring processes on shared systems.
- The script is intended for lightweight process monitoring and may not be suitable for high-security or enterprise environments without modifications.

---

## License
This script is provided "as is" with no warranties. Use it at your own risk.

