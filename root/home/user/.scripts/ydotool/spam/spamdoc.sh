ydotoold &>/dev/null &
sleep 2
for i in $(seq 1 $3); do
	cat $1 | while read line; do
		echo $line | wl-copy
		ydotool key 29:1 key 42:1 47:1; ydotool key 29:0 key 42:0 47:0
		ydotool type "\n\n"
		sleep $2
	done
done
pkill ydotoold
