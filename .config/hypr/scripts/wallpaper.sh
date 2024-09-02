#!/bin/bash
#                _ _                              
# __      ____ _| | |_ __   __ _ _ __   ___ _ __  
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                   |_|         |_|               
#  
# ----------------------------------------------------- 
# Check to use wallpaper cache
# ----------------------------------------------------- 

use_cache=0
if [ -f ~/.config/ngeran/settings/wallpaper_cache ] ;then
    use_cache=1
fi

if [ "$use_cache" == "1" ] ;then
    echo ":: Using Wallpaper Cache"
else
    echo ":: Wallpaper Cache disabled"
fi

# ----------------------------------------------------- 
# Set defaults
# ----------------------------------------------------- 

force_generate=0
generated_versions="$HOME/.config/ngeran/cache/wallpaper-generated"
cache_file="$HOME/.config/ngeran/cache/current_wallpaper"
rasi_file="$HOME/.config/ngeran/cache/current_wallpaper.rasi"
default_wallpaper="$HOME/wallpaper/default.jpg"

# Create folder with generated versions of wallpaper if not exists
if [ ! -d $generated_versions ] ;then
    mkdir $generated_versions
fi

# ----------------------------------------------------- 
# Get selected wallpaper
# ----------------------------------------------------- 

if [ -z $1 ] ;then
    if [ -f $cache_file ] ;then
        wallpaper=$(cat $cache_file)
    else
        wallpaper=$default_wallpaper
    fi
else
    wallpaper=$1
fi
used_wallpaper=$wallpaper
echo ":: Setting wallpaper with original image $wallpaper"
tmp_wallpaper=$wallpaper

# ----------------------------------------------------- 
# Copy path of current wallpaper to cache file
# ----------------------------------------------------- 

if [ ! -f $cache_file ] ;then
    touch $cache_file
fi
echo "$wallpaper" > $cache_file
echo ":: Path of current wallpaper copied to $cache_file"

# ----------------------------------------------------- 
# Get wallpaper filename
# ----------------------------------------------------- 
wallpaper_filename=$(basename $wallpaper)
echo ":: Wallpaper Filename: $wallpaper_filename"

# ----------------------------------------------------- 
# Execute pywal
# ----------------------------------------------------- 
echo "=====================PYWAL========================="
echo ":: Execute pywal with $used_wallpaper"
wal -q -i $used_wallpaper
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Write hyprpaper.conf
# -----------------------------------------------------

echo ":: Setting wallpaper with $used_wallpaper"
killall -e hyprpaper & 
sleep 1; 
wal_tpl=$(cat $HOME/.config/ngeran/settings/hyprpaper.tpl)
output=${wal_tpl//WALLPAPER/$used_wallpaper}
echo "$output" > $HOME/.config/hypr/hyprpaper.conf
hyprpaper & > /dev/null 2>&1

# ----------------------------------------------------- 
# Reload Waybar
# -----------------------------------------------------
~/.config/waybar/launch.sh

