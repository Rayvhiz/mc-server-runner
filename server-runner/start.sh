#!/bin/bash
# Get Minecraft server path and directory name
path="$(dirname "$PWD")"
dir="$(basename "$path")"

# If Minecraft server restart got restartet, wait for closing existing screen
if [ "$1" == "restart" ]; then
        path="$2"
        dir="$(basename "$path")"

        # Wait if server gets stopped by user
        sleep 5

        # Wait for server screen to close
        while screen -list | grep -q "$dir"; do
                echo "Waiting for server to stop"
                sleep 1
        done

        echo "Screen closed"
fi

# Check if Minecraft server is already running
if screen -list | grep -q "$dir"; then
        echo "Minecraft server '$dir' is already running."
else
        # Get forge server jar file
        file="$(find "$path" -maxdepth 1  -type f -name 'forge-*.jar' | sed 's|^./||')"

        # Start Minecraft server in a detached screen and pass arguments
        screen -AmdS $dir $path/server-runner/run.sh $path $file nogui
        echo "Minecraft server '$dir' started."
fi
