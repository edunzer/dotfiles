#!/bin/bash

echo "*------------------------------------- Desktop Start -------------------------------------*"

# Set up the desktop environment
cp ../img/ArcPopOSLogo.jpg ~edunzer/Pictures/Wallpapers/ArcPopOSLogo.jpg
cp ../img/MountainRangePopLogo.jpg ~edunzer/Pictures/Wallpapers/MountainRangePopLogo.jpg

cd ~
cd dotfiles/
dconf load /org/gnome/ < settings.dconf
