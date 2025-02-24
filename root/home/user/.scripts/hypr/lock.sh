#!/bin/bash

file=~/.scripts/hypr/locked
cur="$(cat $file)"
if [[ $cur -eq 0 ]]; then
	echo "1" > $file
	hyprctl dispatch workspace name:~
	pkill -SIGUSR1 waybar
	dunstctl set-paused true
	hyprctl dispatch submap locked
	swaylock
	pkill -SIGUSR2 waybar
	hyprctl dispatch workspace previous
	hyprctl dispatch submap reset
	dunstctl set-paused false
	dunstify -a "System" "Notifications" "Resumed Notifications"	
	echo "0" > $file
fi
