#!/bin/bash
# this is a replacement for the existing script, since it is very unintuitive
# let's make it so that only selecting a file works, having to shuffle through them is a PITA

path=$(cd "$(dirname "$0")" && pwd) # script path
file=$1

# set wallpaper and color scheme
wal -nstei "$file" --cols16 darken --contrast 2
swww img "$file" --fill-color $(sed '1!d' ~/.cache/wal/colors) --transition-step 15 --transition-duration 0.3 --transition-type fade --transition-fps 144

# reload multiple items that require config updates
$path/keyboard.sh 0
pkill -SIGUSR1 kitty
pywal-discord -t universal &
pywalfox update &
gsettings set org.gnome.desktop.interface gtk-theme Adawaita && gsettings set org.gnome.desktop.interface gtk-theme Universal &

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

pkill dunst
$(xrdb -load  ~/.Xresources)&
