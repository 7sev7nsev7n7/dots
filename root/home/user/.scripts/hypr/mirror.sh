#!/bin/bash

mirror=$(hyprctl monitors all | awk '/HDMI-A-1/,EOF' | grep 'mirrorOf' | sed -n 's/.* \(\w*\)/\1/p')

if [ ! -z mirror ]; then
  [ "$mirror" == "none" ] && n='eDP-1' || n='none'
  hyprctl keyword monitorv2[HDMI-A-1]:mirror $n
fi
