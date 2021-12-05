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
sleep 2 # Waits x second.
figlet "5"
sleep 1 # Waits x second. 
figlet "4" 
sleep 1 # Waits x second.
figlet "3" 
sleep 1 # Waits x second.
figlet "2" 
sleep 1 # Waits x second.
figlet "1" 
sleep 1 # Waits x second.
figlet "Initialize!" | lolcat
sleep 1 # Waits x second.

# Clear terminal
clear

# Setup command run
#./setup.sh
