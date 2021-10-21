#!/bin/bash
# Get current folder name
folder="${PWD##*/}"

# Check if Minecraft server is already running
if screen -list | grep -q "$folder";
then
	echo "Minecraft server '$folder' is already running"
else
	# Get path and server jar file name
	path="${PWD}"
	file="$(find -name 'forge-*' -type f | sed 's|^./||')"

	# Start Minecraft server in a deatached screen and pass some arguments
	screen -AmdS $folder $path/run.sh $path/$file nogui
	echo "Minecraft server '$folder' started"	
fi