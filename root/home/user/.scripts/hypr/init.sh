#!/usr/bin/bash

# applications that are opened via a launcher
# (e.g. discord) may open on the incorrect workspace
# since the focus might change. experiment with
# hyprland configs and variables to see if this
# can be fixed.

# first workspace
sleep 1
hyprctl dispatch exec kitty btop
sleep 0.1
hyprctl dispatch exec kitty ranger
sleep 0.1
hyprctl dispatch exec kitty

# second workspace
hyprctl dispatch exec [workspace 2] firefox
