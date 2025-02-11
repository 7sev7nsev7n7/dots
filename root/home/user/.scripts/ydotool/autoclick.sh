$(ydotoold &> /dev/null) &
echo "switch now"
sleep 3
while true; do
	if [ "$1" == "r" ]; then
		ydotool click 41 81 > /dev/null
	else
		ydotool click 40 80 > /dev/null
	fi
	sleep $2
done
pkill -9 ydotool
