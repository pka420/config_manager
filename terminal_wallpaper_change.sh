#!/bin/bash

CONFIG_FILE="$HOME/.config/xfce4/terminal/terminalrc"
#WALLPAPER_DIR="$HOME/projects/wallpapers/Universal"
WALLPAPER_DIR="$HOME/projects/Wallpapers/other-themes"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Update the wallpaper path in the config file
sed -i "s|^BackgroundImageFile=.*|BackgroundImageFile=$WALLPAPER|" "$CONFIG_FILE"
