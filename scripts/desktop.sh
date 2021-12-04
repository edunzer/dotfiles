#!/bin/bash

echo "*------------------------------------- Desktop Start -------------------------------------*"

# Set up the desktop environment
cp ../img/ArcPopOSLogo.jpg ~/ArcPopOSLogo.jpg
cp ../img/MountainRangePopLogo.jpg ~/MountainRangePopLogo.jpg
dconf load /org/gnome/ < ../../settings.dconf
