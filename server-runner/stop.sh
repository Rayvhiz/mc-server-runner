#!/bin/bash
# Get Minecraft server directory name
path="$(dirname "$PWD")"
dir="$(basename "$path")"

# Check if Minecraft server is already running
if screen -list | grep -q "$dir"; then
    # Stop Minecraft server
	screen -r $dir -X quit
    echo "Minecraft server '$dir' stopped."
else
	# Notify that server wasn not running
	echo "Minecraft server '$dir' was not running."
fi
