#!/bin/bash


# ----------------------------------------------------- 
# Start Waybar
# ----------------------------------------------------- 

# Check if waybar-disabled file exists
if [ -f $HOME/.cache/waybar-disabled ] ;then 
    killall waybar
    pkill waybar
    exit 1 
fi

# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
killall waybar
pkill waybar
sleep 0.5

# ----------------------------------------------------- 
# Default theme: /THEMEFOLDER;/VARIATION
# ----------------------------------------------------- 
themestyle="/ngeran;/ngeran/white"

# ----------------------------------------------------- 
# Get current theme information from ~/.config/waybar/waybar-theme.sh
# ----------------------------------------------------- 
if [ -f ~/.config/waybar/waybar-theme.sh ]; then
    themestyle=$(cat ~/.config/waybar/waybar-theme.sh)
else
    touch ~/.config/waybar/waybar-theme.sh
    echo "$themestyle" > ~/.config/waybar/waybar-theme.sh
fi

IFS=';' read -ra arrThemes <<< "$themestyle"
echo ":: Theme: ${arrThemes[0]}"

if [ ! -f ~/.config/waybar/themes${arrThemes[1]}/style.css ]; then
    themestyle="/ngeran;/ngeran/light"
fi

# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 
config_file="config"
style_file="style.css"
echo  ~/.config/waybar/themes${arrThemes[0]}/config-custom
echo  ~/.config/waybar/themes${arrThemes[1]}/style-custom.css


waybar -c ~/.config/waybar/$config_file -s ~/.config/waybar/themes${arrThemes[1]}/$style_file &
