# Minecraft Server Runner for Forge servers on Linux

## Description
The script starts, stops and restarts a Minecraft Forge server, if it crashes. This script was made to make my friends life easier.

## Prerequisite
1. A Minecraft Forge server
2. Java
    - Run `sudo apt install default-jre-headless` to install Java
3. Screen
    - Run `sudo apt update && apt-get install screen` to install Screen
    - Run `screen --version` to check if Screen installed succesfully

## How to start the Minecraft server
1. Copy ***mcsr.sh*** and ***jvm_args.txt*** into the existing Minecraft server directory
2. Run `chmod +x mcsr.sh` in the directory to make the script executable
3. Edit ***jvm_args.txt***, if you want to add java arguments for the Minecraft server
4. Run `./mcsr.sh start` in the directory to start the Minecraft server

## How to stop the Minecraft server
1. Run `./mcsr.sh stop` in the directory to stop the Minecraft server directory

## How to start the Minecraft server automatically on startup of the Linux server
1. Run `crontab -e` to edit cronjobs
2. Add `@reboot bash -c "cd /<mc-server-path>/; ./mcsr.sh start"` and edit the path to the Minecraft server directory, to start the server on boot
3. Add `* 3 * * * bash -c "cd /<mc-server-path>/; ./mcsr.sh restart"`  and edit the path to the Minecraft server directory, to auto restart the server at 3am
