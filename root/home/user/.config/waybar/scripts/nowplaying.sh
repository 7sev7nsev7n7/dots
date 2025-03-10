#~/bin/bash
out="$(playerctl metadata artist | sed -e 's/ - Topic//'): $(playerctl metadata title)"
if [ "$out" == ": " ]; then
	out="No media"
fi
echo {\"text\": \"$out\"}
