#!/bin/bash

sudo apt install figlet -y
sudo apt install lolcat -y
clear

figlet "Time to get some upgrades?"

sleep 2 # Waits x second.

sudo apt-get update 
sudo apt-get upgrade 

echo "*------------------------------------- Upgrade Complete! -------------------------------------*"

sleep 2 # Waits x second.
clear

# progress bar function

function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")
# Output example: Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
}
# Variables
_start=1
# This accounts as the "totalState" variable for the ProgressBar function
_end=100

# Enter directory
cd ~
cd dotfiles/scripts/

# Set all .sh files to executable
chmod +x aptinstall.sh
chmod +x desktop.sh
chmod +x setup.sh
chmod +x symlink.sh

figlet "Preparing Files!"

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    sleep 0.1
    ProgressBar ${number} ${_end}
done
printf '\nFinished!\n'

sleep 2 # Waits x second.
clear

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
