#!/bin/bash

# Function to stop graphical mode
stop_graphics() {
    echo "Stopping graphical mode..."
    sudo systemctl stop display-manager.service
    echo "Graphical mode stopped."
}

# Function to start graphical mode
start_graphics() {
    echo "Starting graphical mode..."
    sudo systemctl start display-manager.service
    echo "Graphical mode started."
}

# Check for user input
if [ "$1" == "off" ]; then
    stop_graphics
elif [ "$1" == "on" ]; then
    start_graphics
else
    echo "Usage: $0 {on|off}"
    exit 1
fi