#!/bin/bash

echo "*------------------------------------- App Install Start -------------------------------------*"

sudo apt update
sudo apt install flatpak -y

function flatpak {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    flatpak install flathub $1
  else
    echo "Already installed: ${1}"
  fi
}

function inst {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

function snap {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo snap install $1
  else
    echo "Already installed: ${1}"
  fi
}





# Basics
inst chromium-browser
inst curl
inst git
inst nmap
snap spotify
snap discord
flatpak io.github.shiftey.Desktop
flatpak com.visualstudio.code


# Image processing
inst gimp

# Fun stuff
inst figlet
inst lolcat

sudo apt autoremove -y
