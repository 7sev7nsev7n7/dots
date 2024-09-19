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

cp ~/.cache/wal/colors-swaylock ~/.config/swaylock/config

cp ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
pkill dunst
$(dunst &>/dev/null) &

cp ~/.cache/wal/Xresources ~/.Xresources
$(xrdb -load  ~/.Xresources)&

hyprctl reload
