# Minecraft Server Scripts

## How to get the Minecraft forge server automaticly running on a Linux server
1. Copy they files into the existing minecraft server folder
2. Run ```chmod +x start.sh stop.sh run.sh``` to make the scripts executable
3. Run ```crontab -e``` in the terminal and select an editor of your choicel
4. Add ```* * * * * bash /home/minecraft/yourserverfolder/start.sh``` with your server path and save the file
5. The server will start automaticly every full minute if its not running

## How to stop the Minecraft server
1. Run ```crontab -e``` in the terminal and select an editor of your choicel
2. Selete the line ```* * * * * bash /home/minecraft/yourserverfolder/start.sh``` which you created
3. Run the stop.sh script in the minecraft server folder
