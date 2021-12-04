#!/bin/bash

./symlink.sh
./aptinstall.sh
./desktop.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bashrc

# Fun hello
figlet "... Setup Complete!" | lolcat
