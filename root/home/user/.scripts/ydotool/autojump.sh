$(ydotoold &> /dev/null) &
while true; do
	$(ydotool type " " &> /dev/null) &
	sleep 30
done
pkill -9 ydotool
