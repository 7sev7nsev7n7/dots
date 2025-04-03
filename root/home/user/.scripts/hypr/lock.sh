#!/bin/bash

# Initialize lock screen and disable waybar
# and notifications while locked
hyprctl dispatch workspace name:~
pkill -SIGUSR1 waybar
dunstctl set-paused true
swaylock

# Resume normal execution, returning waybar and
# returning to previous workspace. Also resumes
# notifications
pkill -SIGUSR2 waybar
hyprctl dispatch workspace previous
dunstctl set-paused false
dunstify -a "System" "Notifications" "Resumed Notifications"	
