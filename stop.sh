#!/bin/bash
# Get current folder name
folder="${PWD##*/}"

# Stop Minecraft server
screen -r $folder -X quit
echo "Minecraft server '$folder' stopped"