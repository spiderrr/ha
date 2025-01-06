#!/bin/bash

# Check if the user provided an application name
if [ -z "$1" ]; then
    echo "Usage: $0 <application_name>"
    exit 1
fi

APP_NAME=$1

# Update the package list
echo "Updating package list..."
sudo apt-get update

# Remove the application
echo "Removing $APP_NAME..."
sudo apt-get remove --purge -y $APP_NAME

# Clean up
echo "Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get clean

echo "$APP_NAME has been removed successfully."
# Optionally, remove the application's desktop entry
DESKTOP_ENTRY="/usr/share/applications/${APP_NAME}.desktop"
if [ -f "$DESKTOP_ENTRY" ]; then
    echo "Removing desktop entry for $APP_NAME..."
    sudo rm -f "$DESKTOP_ENTRY"
fi

# Remove user-specific application configurations
USER_CONFIG_DIR="$HOME/.config/$APP_NAME"
if [ -d "$USER_CONFIG_DIR" ]; then
    echo "Removing user-specific configuration for $APP_NAME..."
    rm -rf "$USER_CONFIG_DIR"
fi

# Ensure only server tools are left
echo "Ensuring only server tools are left..."
sudo apt-get install -y --no-install-recommends server-tools

# Remove LibreOffice if it is the application being removed
if [ "$APP_NAME" == "libreoffice" ]; then
    echo "Removing LibreOffice..."
    sudo apt-get remove --purge -y libreoffice*
    sudo apt-get autoremove -y
    sudo apt-get clean
    echo "LibreOffice has been removed successfully."
fi

# Remove Citrix package if it is the application being removed
if [ "$APP_NAME" == "citrix" ]; then
    echo "Removing Citrix..."
    sudo apt-get remove --purge -y icaclient
    sudo apt-get autoremove -y
    sudo apt-get clean
    echo "Citrix has been removed successfully."
fi


# Check disk speed
echo "Checking disk speed..."
sudo hdparm -Tt /dev/sda


# Remove all Windows applications from default installation of Debian 12
echo "Removing all Windows applications from default installation..."
sudo apt-get remove --purge -y wine* winetricks
sudo apt-get autoremove -y
sudo apt-get clean
echo "All Windows applications have been removed successfully."
# Remove all GUI applications from default installation of Debian 12
echo "Removing all GUI applications from default installation..."
sudo apt-get remove --purge -y gnome* xorg* lightdm* xfce4* kde* lxde* cinnamon* mate* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All GUI applications have been removed successfully."

# Remove all games from default installation of Debian 12
echo "Removing all games from default installation..."
sudo apt-get remove --purge -y games* steam* playonlinux* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All games have been removed successfully."

# Remove all multimedia applications from default installation of Debian 12
echo "Removing all multimedia applications from default installation..."
sudo apt-get remove --purge -y vlc* gimp* audacity* kdenlive* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All multimedia applications have been removed successfully."

# Remove all office applications from default installation of Debian 12
echo "Removing all office applications from default installation..."
sudo apt-get remove --purge -y libreoffice* openoffice* abiword* gnumeric* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All office applications have been removed successfully."

# Remove all development tools from default installation of Debian 12

echo "Removing all development tools from default installation..."
sudo apt-get remove --purge -y build-essential gcc g++ make cmake git python3* ruby* perl* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All development tools have been removed successfully."

# Remove all server tools from default installation of Debian 12
echo "Removing all server tools from default installation..."
sudo apt-get remove --purge -y apache2* nginx* mysql-server* postgresql* samba* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All server tools have been removed successfully."

# Remove all system tools from default installation of Debian 12

echo "Removing all system tools from default installation..."
sudo apt-get remove --purge -y htop* sysstat* lsof* strace* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All system tools have been removed successfully."

# Remove all network tools from default installation of Debian 12
echo "Removing all network tools from default installation..."
sudo apt-get remove --purge -y net-tools* nmap* wireshark* tcpdump* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All network tools have been removed successfully."

# Remove all security tools from default installation of Debian 12
echo "Removing all security tools from default installation..."
sudo apt-get remove --purge -y john* hydra* aircrack-ng* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All security tools have been removed successfully."

# Remove all virtualization tools from default installation of Debian 12
echo "Removing all virtualization tools from default installation..."
sudo apt-get remove --purge -y virtualbox* qemu* kvm* libvirt* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All virtualization tools have been removed successfully."

# Remove all cloud tools from default installation of Debian 12
echo "Removing all cloud tools from default installation..."
sudo apt-get remove --purge -y awscli* azure-cli* google-cloud-sdk* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All cloud tools have been removed successfully."

# Remove all container tools from default installation of Debian 12

echo "Removing all container tools from default installation..."
sudo apt-get remove --purge -y docker* podman* containerd* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All container tools have been removed successfully."

# Remove all monitoring tools from default installation of Debian 12

echo "Removing all monitoring tools from default installation..."
sudo apt-get remove --purge -y nagios* zabbix* prometheus* grafana* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All monitoring tools have been removed successfully."

# Remove all database tools from default installation of Debian 12

echo "Removing all database tools from default installation..."
sudo apt-get remove --purge -y mysql* postgresql* sqlite* mariadb* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All database tools have been removed successfully."

# Remove all backup tools from default installation of Debian 12

echo "Removing all backup tools from default installation..."
sudo apt-get remove --purge -y rsync* duplicity* borgbackup* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All backup tools have been removed successfully."

# Remove all logging tools from default installation of Debian 12

echo "Removing all logging tools from default installation..."
sudo apt-get remove --purge -y rsyslog* logrotate* journalctl* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All logging tools have been removed successfully."

# Remove all web tools from default installation of Debian 12

echo "Removing all web tools from default installation..."
sudo apt-get remove --purge -y curl* wget* lynx* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All web tools have been removed successfully."

# Remove all text tools from default installation of Debian 12

echo "Removing all text tools from default installation..."
sudo apt-get remove --purge -y nano* vim* emacs* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All text tools have been removed successfully."

# Remove all compression tools from default installation of Debian 12

echo "Removing all compression tools from default installation..."
sudo apt-get remove --purge -y zip* unzip* tar* gzip* bzip2* xz-utils* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All compression tools have been removed successfully."

# Remove all image tools from default installation of Debian 12

echo "Removing all image tools from default installation..."
sudo apt-get remove --purge -y imagemagick* gimp* inkscape* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All image tools have been removed successfully."


# Remove all audio tools from default installation of Debian 12
echo "Removing all audio tools from default installation..."
sudo apt-get remove --purge -y audacity* alsa* pulseaudio* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All audio tools have been removed successfully."

# Remove all video tools from default installation of Debian 12
echo "Removing all video tools from default installation..."
sudo apt-get remove --purge -y vlc* ffmpeg* kdenlive* 
sudo apt-get autoremove -y
sudo apt-get clean
echo "All video tools have been removed successfully."

# Remove all applications to minimal installation of Debian 12
# echo "Removing all applications to minimal installation..."
# sudo apt-get remove --purge -y $(dpkg --get-selections | grep -v deinstall | awk '{print $1}')
# sudo apt-get autoremove -y
# sudo apt-get clean
# echo "All applications have been removed to minimal installation."


# Remove all applications from default installation of Debian 12
# echo "Removing all applications from default installation..."
# sudo apt-get remove --purge -y $(dpkg --get-selections | grep -v deinstall | awk '{print $1}')
# sudo apt-get autoremove -y
# sudo apt-get clean
# echo "All applications have been removed from default installation."

# Remove all applications to default server tools installation of Debian 12
echo "Removing all applications to default server tools installation..."
sudo apt-get remove --purge -y $(dpkg --get-selections | grep -v deinstall | awk '{print $1}')
sudo apt-get autoremove -y
sudo apt-get clean
echo "All applications have been removed to default server tools installation."

# Install default server tools
echo "Installing default server tools..."
sudo apt-get install -y --no-install-recommends apache2 nginx mysql-server postgresql samba
echo "Default server tools have been installed successfully."

# # Check disk speed
# echo "Checking disk speed again..."
# sudo hdparm -Tt /dev/sda


