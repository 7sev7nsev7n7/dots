#~/bin/bash
out="$(playerctl metadata title)"
if [ "$out" == ": " ]; then
	out="No media"
fi
echo {\"text\": \"$out\"}
