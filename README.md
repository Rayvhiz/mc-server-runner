# Minecraft Server Scripts

## How to get the Minecraft forge server automaticly running on a Linux server
1. Copy they files into the existing server folder
2. Run ```crontab -e``` in the terminal and select an editor of your choicel
3. Add ```* * * * * bash /home/minecraft/yourserverfolder/start.sh``` with your server path and save the file
4. The server will start automaticly every full minute if its not running
