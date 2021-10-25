# Minecraft Forge Server Runner for Linux Server

## Description
The scripts start a Minecraft Forge server and restart the server, if it crashes. This scripts were made to make my friends life easier.

## Prerequisite
1. A Minecraft Forge server
2. Java 
    - Run `sudo apt install default-jre-headless` to install Java
3. Screen
    - Run `sudo apt update && apt-get install screen` to install Screen
    - Run `screen --version` to check if Screen installed succesfully

## How to start the Minecraft server
1. Copy the folder ***server-runner*** into the existing Minecraft server directory
2. Run `chmod +x start.sh stop.sh run.sh` in the ***server-runner*** directory to make the scripts executable
3. Edit ***jvm_args.txt***, if you want to add java arguments for the Minecraft server
4. Run `./start.sh` in the ***server-runner*** directory to start the Minecraft server

## How to stop the Minecraft server
1. Run `./stop.sh` in the ***server-runner*** directory to stop the Minecraft server directory

## How to start the Minecraft server automatically on startup of the Linux server
1. Run `crontab -e` to edit cronjobs
2. Add `@reboot cd /<mc-server-path>/server-runner && ./start.sh` and edit the path to the Minecraft server directory
3. Add `* 3 * * * screen -S <mc-server-folder-name> -X stuff "stop^M"`  and edit the folder name of the Minecraft server, to auto restart the server at 3am
