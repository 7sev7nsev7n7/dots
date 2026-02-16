#!/bin/bash

# initialize variables
path=$(cd "$(dirname "$0")" && pwd) # script path
file=$1

# set wallpaper and color scheme
wal -nstei "$file" --cols16 lighten --backend colorthief 
swww img "$file" --transition-type none

# reload multiple items that require config updates
$path/keyboard.sh 0
pkill -SIGUSR1 kitty
pywal-discord -t universal
pywalfox update
gsettings set org.gnome.desktop.interface gtk-theme Adawaita && gsettings set org.gnome.desktop.interface gtk-theme Universal
pkill dunst
$(xrdb -load  ~/.Xresources)

# check if files are softlinked, create softlinks otherwise
sources=(~/.cache/wal/colors-swaylock ~/.cache/wal/dunstrc ~/.cache/wal/Xresources) # source configuration file
destinations=(~/.config/swaylock/config ~/.config/dunst/dunstrc ~/.Xresources) # destination configuration file

for i in $(seq 0 $((${#sources[@]}-1))); do
	if [ -h ${destinations[$i]} ]; then 
		if [ "$(readlink ${destinations[$i]})" == "${sources[$i]}" ]; then
			continue
		else
			rm ${destinations[$i]}
		fi
	fi
	ln -s ${sources[$i]} ${destinations[$i]}; echo "created softlink from ${sources[$i]} at ${destinations[$i]}"
done
