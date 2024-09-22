#!/bin/bash
# this is a replacement for the existing script, since it is very unintuitive
# let's make it so that only selecting a file works, having to shuffle through them is a PITA

path=$(cd "$(dirname "$0")" && pwd) # script path
file=$1

# set wallpaper and color scheme
$(swww img "$file" --transition-step 90 --transition-duration 1 --transition-type grow --transition-fps 144 &> /dev/null)
wal -sni "$file"

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
		else :
		fi
	else :
	fi
	rm ${destinations[$i]}; ln -s ${sources[$i]} ${destinations[$i]}; echo "done!"
done

pkill dunst
$(xrdb -load  ~/.Xresources)&

hyprctl reload
