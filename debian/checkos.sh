#!/bin/bash

# Function to check system logs for errors
check_logs() {
    echo "Checking system logs for errors..."
    sudo journalctl -xe | tail -n 50
    dmesg | tail -n 50
}

# Function to check CPU, Memory, and Disk usage
check_resources() {
    echo "Checking system resource usage..."
    echo "CPU and Memory usage:"
    top -b -n 1 | head -n 20
    echo "Disk usage:"
    df -h
    echo "Disk I/O stats:"
    iostat -x 1 2
}

# Function to check disk space
check_disk_space() {
    echo "Checking disk space..."
    df -h
    du -sh /* 2>/dev/null | sort -hr | head -n 10
}

# Function to check for hardware errors
check_hardware() {
    echo "Checking for hardware errors..."
    dmesg | grep -i error
    sudo smartctl -a /dev/sda | grep -iE 'error|fail'
    sensors
}

# Function to check for driver or kernel issues
check_kernel_drivers() {
    echo "Checking for kernel and driver issues..."
    dmesg | grep -i firmware
    lsmod
    uname -r
}

# Function to check for Out of Memory kills
check_oom() {
    echo "Checking for Out of Memory events..."
    dmesg | grep -i 'out of memory'
    sudo cat /var/log/syslog | grep -i 'oom'
}

# Function to check for file system errors
check_filesystem() {
    echo "Checking filesystem for errors..."
    sudo fsck -N
}

# Function to check peripheral devices
check_peripherals() {
    echo "Checking connected peripheral devices..."
    lsusb
    lspci
}

# Main script execution
check_logs
read -p "Press Enter to continue to resource check..."

check_resources
read -p "Press Enter to continue to disk space check..."

check_disk_space
read -p "Press Enter to continue to hardware check..."

check_hardware
read -p "Press Enter to continue to kernel and driver check..."

check_kernel_drivers
read -p "Press Enter to continue to OOM check..."

check_oom
read -p "Press Enter to continue to filesystem check..."

check_filesystem
read -p "Press Enter to continue to peripheral check..."

check_peripherals

echo "System check completed."
read -p "Press Enter to exit."

exit 0
