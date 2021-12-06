#!/bin/bash

echo "*------------------------------------- Desktop Start -------------------------------------*"

# Set up the desktop environment
cp ../img/ArcPopOSLogo.jpg ~v/Pictures/Wallpapers/ArcPopOSLogo.jpg
cp ../img/MountainRangePopLogo.jpg ~v/Pictures/Wallpapers/MountainRangePopLogo.jpg

cd ~
cd dotfiles/
dconf load /org/gnome/ < settings.dconf

gsettings set org.gnome.desktop.background picture-uri file:////home/v/dotfiles/img/ubuntu-default-greyscale-wallpaper.png
