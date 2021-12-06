#!/bin/bash

echo "*------------------------------------- Desktop Start -------------------------------------*"

# Set up the desktop environment
cp ../img/ArcPopOSLogo.jpg ~/ArcPopOSLogo.jpg
cp ../img/MountainRangePopLogo.jpg ~/MountainRangePopLogo.jpg

cd ~
cd dotfiles/
dconf load /org/gnome/ < settings.dconf

gsettings set org.gnome.desktop.background picture-uri file:////home/usr/dotfiles/img/MountainRangePopLogo.jpg
