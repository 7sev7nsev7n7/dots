ydotoold &>/dev/null &
sleep 2
for i in $(seq 1 $2); do
	ydotool key 29:1 key 42:1 47:1; ydotool key 29:0 key 42:0 47:0
	ydotool type "\n\n"
	sleep $1
done
pkill ydotoold
