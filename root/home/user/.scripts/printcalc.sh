#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then 
	echo -e "usage:	printcalc [weight (g)] [price (kg)]\n"
	exit
fi

echo "$(calc \(\($2/1000\)*$1\)+20)"
