#!/bin/bash

# Enter directory
cd ~
cd dotfiles/scripts/

# Set all .sh files to executable
chmod +x aptinstall.sh
chmod +x desktop.sh
chmod +x setup.sh
chmod +x symlink.sh

# Fun start
figlet "Starting Initialization!" | lolcat
sleep .5 # Waits 0.5 second.
figlet "5"
sleep .5 # Waits 0.5 second. 
figlet "4" 
sleep .5 # Waits 0.5 second.
figlet "3" 
sleep .5 # Waits 0.5 second.
figlet "2" 
sleep .5 # Waits 0.5 second.
figlet "1" 
sleep .5 # Waits 0.5 second.

# Clear terminal
clear

# Setup command run
./setup.sh
