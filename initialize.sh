#!/bin/bash

# progress bar function

prog() {
    local w=80 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
}

# Enter directory
cd ~
cd dotfiles/scripts/

# Set all .sh files to executable
chmod +x aptinstall.sh
chmod +x desktop.sh
chmod +x setup.sh
chmod +x symlink.sh

figlet "Preparing Files!"
for x in {1..100} ; do
    prog "$x" still working...
    sleep .05   # do some work here
done ; echo
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
