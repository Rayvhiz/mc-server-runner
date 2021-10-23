#!/bin/bash
# Get Minecraft server path and directory name
path="$(dirname "$PWD")"
dir="$(basename "$path")"

echo $path

# Check if Minecraft server is already running
if screen -list | grep -q "$dir"; then
	echo "Minecraft server '$dir' is already running."
else
	# Get forge server jar file
	file="$(find -name 'forge-*' -type f | sed 's|^./||')"

	# Start Minecraft server in a detached screen and pass arguments
	screen "-AmdS $dir $path/server-runner/run.sh $path/$file nogui"
	echo "Minecraft server '$dir' started."
fi
