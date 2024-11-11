#~/bin/bash
count=$(dunstctl count history)
paused=$(dunstctl is-paused)
all=$(dunstctl count)

if [[ "$paused" == "true" ]]; then
	echo -n {\"alt\": \"$paused\", \"text\": \"\", \"tooltip\": \"$all\", \"class\": \"$paused\"}
else
	echo -n {\"text\": \"$count\", \"tooltip\": \"$all\", \"class\": \"$count\"}
fi
