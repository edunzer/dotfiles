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

i=$((1*10)); while [ $i -gt 0 ]; do clear; echo $i | figlet; sleep 1; i=$(($i-1)); done; #countdown timer

clear
sleep 1 # Waits x second.
figlet "Initialize!" | lolcat
sleep 1 # Waits x second.

# Setup command run
./setup.sh
