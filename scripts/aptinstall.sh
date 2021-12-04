#!/bin/bash

sudo apt update

function install {
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
    sudo snap install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

sudo apt install flatpak -y

function flatpak {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    flatpak install flathub -y $1
  else
    echo "Already installed: ${1}"
  fi
}



# Basics
install chromium-browser
install curl
install git
install nmap
snap code --classic
snap spotify discord
flatpak io.github.shiftey.Desktop


# Image processing
install gimp

# Fun stuff
install figlet
install lolcat
