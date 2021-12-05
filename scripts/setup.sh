#!/bin/bash

sudo apt install figlet -y
sudo apt install lolcat -y

./symlink.sh
./aptinstall.sh
./desktop.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bashrc

# Fun hello
figlet "... Setup Complete!" | lolcat

while true; do
    read -p "Do you want to delete the dotfiles cloned directory? [y/n]" yn
    case $yn in
        [Yy]* ) cd ~; rm -r dotfiles/;  break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done