#!/bin/bash
# Forge requires a configured set of both JVM and program arguments.
# Add custom JVM arguments to the user_jvm_args.txt
# Add custom program arguments {such as nogui} to this file in the next line before the "$@" or
#  pass them to this script directly
if [ "$#" -ge "2" ]; then
    path="$1"
    shift
    file="$1"
    shift
    jvm_args="$(grep ^[^#] $path/server-runner/jvm_args.txt |tr '\n' ' ')"

    # Run server file
    cd "$path"
    java $jvm_args -jar $file "$@"

    # Restart server if closed or crashed
    screen -AmdS server-restart $path/server-runner/start.sh restart $path
    echo "Restarting Minecraft server"
else
    echo "Missing arguments: <dir-path> <file-path>"
fi
