#!/bin/bash

echo "*------------------------------------- App Install Start -------------------------------------*"

sudo apt update
sudo apt install flatpak -y

# Basics
sudo apt install curl -y
sudo apt install git -y
sudo apt install nmap -y 

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb 
flatpak install flathub io.github.shiftey.Desktop -y
flatpak install flathub com.visualstudio.code -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.discordapp.Discord -y

# Image processing
sudo apt install gimp -y

# Fun stuff
sudo apt install figlet -y
sudo apt install lolcat -y

sudo apt autoremove -y
