# Minecraft Forge Server Auto Starter for Linux

## Description
The scripts start a Minecraft Forge server and restart the server, if it crashes. The scripts check every full minute, if the Minecraft server is still alive.

## Prerequisite
1. Minecraft Forge server on a Linux system
2. Screen
    - Run `sudo apt update && apt-get install screen` to install Screen
    - Run `screen --version` to check if Screen installed succesfully

## How to start the Minecraft server
1. Copy the folder ***server-runner*** into the existing minecraft server directory
2. Run `chmod +x start.sh stop.sh run.sh` in the ***server-runner*** directory to make the scripts executable
3. Edit ***jvm_args.txt***, if you want to add java arguments for the minecraft server
4. Run `crontab -e` to open the Crontab
5. Add `* * * * * cd /your_mc_server_path/server-runner && bash ./start.sh` with your server path and save

## How to stop the Minecraft server
1. Run `crontab -e` to open the Crontab
2. Remove the line `* * * * * cd /your_mc_server_path/server-runner && bash ./start.sh`
3. Run ***stop.sh*** script in the minecraft server directory
