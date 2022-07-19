#!/bin/bash
option="$1"
shift
path="$PWD"
dir="$(basename "$path")"

# Set forge, fabric, spigot, paper or other server type here 
type="forge"

# If Forge is used and Minecraft version is 1.17.0 or higher, set true and set forge file lie in the example below.
new_forge_=false
forge_file="@libraries/net/minecraftforge/forge/1.18.2-40.1.60/unix_args.txt"

case $option in
    start)
        # Check if Minecraft server is already running
        if screen -list | grep -q "$dir"; then
                echo "Minecraft server '$dir' is already running."
        else
                # Get forge server jar file
                file="$(find "$path" -maxdepth 1  -type f -name "$type*.jar" | sed 's|^./||')"

                # Start Minecraft server in a detached screen and pass arguments
                screen -AmdS $dir bash -c "cd $path/; ./mcsr.sh run $file nogui"
                echo "Minecraft server '$dir' started."
        fi
    ;;

    stop)
        # Check if Minecraft server is already running
        if screen -list | grep -q "$dir"; then
            # Stop Minecraft server
            screen -S $dir -X stuff "stop^M"

            # Wait until server stopped
            time=0
            echo "Waiting for server to stop... $time seconds"
            while screen -list | grep -q "$dir"; do
                # Display info for user
                echo -e "\e[1A\e[KWaiting for server to stop... $time seconds"
                ((time=time+1))

                # Force shutdown the Minecraft server if it takes too long
                if [ "$time" -eq 300 ]; then
                    screen -S $dir -X quit
                fi
                sleep 1
            done
            echo "Minecraft server '$dir' stopped."
        else
            # Notify that server was not running
            echo "Minecraft server '$dir' was not running."
        fi
    ;;

    run)
        if [ "$#" -gt 0 ]; then
            file="$1"
            shift
            jvm_args="$(grep ^[^#] ./jvm_args.txt |tr '\n' ' ')"
            
            # Run server file
            if [ "$new_forge" = true ]; then
                java $jvm_args "$forge_file" "$@"
            else
                java $jvm_args -jar $file "$@"
            fi
        else
            echo "Argument missing. Run the script with './mcsr.sh start'"
        fi
    ;;

    *)
        echo "Script requires an argument: <start / stop>"
    ;;
esac
