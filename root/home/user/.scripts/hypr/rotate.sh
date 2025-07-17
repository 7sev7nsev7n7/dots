#!/bin/bash
# $1 will be the rotation (should be a positive or negative value)

offset=$1

rotation=$(hyprctl monitors eDP-1 | grep transform | sed -n "s/^.* //p")
if [[ $(($rotation+$offset)) -lt 0 ]]; then
  offset=3; 
fi
rotation=$((($rotation+$offset)%4))
echo $rotation

hyprctl keyword 'monitorv2[eDP-1]:transform' $rotation
