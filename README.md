# Minecraft Server Runner for Linux

## Description
The script starts, stops and restarts a Minecraft server, if it crashes. This script was made to make my friends life easier.

## Prerequisite
1. A Minecraft Forge, Fabric or Spigot server
2. Java 8 for Minecraft v1.16.5 and lower OR Java 16 for Minecraft v1.17.0 and higher
3. Screen
    - Run `sudo apt update && apt-get install screen` to install Screen
    - Run `screen --version` to check if Screen installed succesfully

## How to start the Minecraft server
1. Copy ***mcsr.sh*** and ***jvm_args.txt*** into the existing Minecraft server directory
2. Run `chmod +x mcsr.sh` in the directory to make the script executable
3. Edit ***mcsr.sh***, if you want to change server type from Forge (Default) to Fabric or Spigot
4. Edit ***jvm_args.txt***, if you want to add java arguments for the Minecraft server
5. Run `crontab -e` to edit cronjobs
6. Add `* * * * * bash -c "cd /<mc-server-path>/; ./mcsr.sh start"` and edit the path to the Minecraft server directory, to let the server start on every full minute, if it's not running
7. Add `0 3 * * * bash -c "cd /<mc-server-path>/; ./mcsr.sh stop"`  and edit the path to the Minecraft server directory, to stop the server at 3am and let the restart happen

## How to stop the Minecraft server
1. Run `crontab -e` to edit cronjobs
2. Delete or comment the line `* * * * * bash -c "cd /<mc-server-path>/; ./mcsr.sh start"`
3. Run `./mcsr.sh stop` in the directory to stop the Minecraft server directory
