# Minecraft Server Scripts

## How to start the Minecraft server
1. Copy they files into the existing minecraft server folder
2. Edit ***user_jvm_args.txt*** if you want to add java arguments for the minecraft server
3. Run `chmod +x start.sh stop.sh run.sh` to make the scripts executable
4. Run `crontab -e` in the terminal and select an editor of your choicel
5. Add `* * * * * cd /your_mc_server_path && bash ./start.sh` with your server path and save the file
6. The server will start automaticly every full minute if it is not already running

## How to stop the Minecraft server
1. Run `crontab -e` in the terminal and select an editor of your choicel
2. Delete the line `* * * * * cd /your_mc_server_path && bash ./start.sh` which you created
3. Run the stop.sh script in the minecraft server folder
