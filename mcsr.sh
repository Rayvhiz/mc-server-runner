#!/bin/bash
option="$1"
shift
path="$PWD"
dir="$(basename "$path")"

wait_server_stop () {
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
}

case $option in
    start)
        # Check if Minecraft server is already running
        if screen -list | grep -q "$dir"; then
                echo "Minecraft server '$dir' is already running."
        else
                # Get forge server jar file
                file="$(find "$path" -maxdepth 1  -type f -name 'forge-*.jar' | sed 's|^./||')"

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
            wait_server_stop

            # Close server restarter
            screen -S server-restart -X quit

            # screen -S server-restart -X quit
            echo "Minecraft server '$dir' stopped."
        else
            # Notify that server was not running
            echo "Minecraft server '$dir' was not running."
        fi
    ;;

    run)
        file="$1"
        shift
        jvm_args="$(grep ^[^#] ./jvm_args.txt |tr '\n' ' ')"

        # Run server file
        java $jvm_args -jar $file "$@"

        # Restart server if closed or crashed
        screen -AmdS server-restart bash -c "cd $path/; ./mcsr.sh restart"
    ;;

    restart)
        # Stop server if it's still running
        if screen -list | grep -q "$dir"; then
            # Stop Minecraft server
            screen -S $dir -X stuff "stop^M"

            # Wait until server stopped
            wait_server_stop
        else
            # Wait if user wants to stop the server
            sleep 5
        fi

        # Run server start
        ./mcsr.sh start
    ;;

    *)
        echo "Script requires an argument: <start / stop>"
    ;;
esac
