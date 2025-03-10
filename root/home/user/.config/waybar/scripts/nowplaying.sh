#~/bin/bash
out="$(playerctl metadata artist): $(playerctl metadata title)"
echo {\"text\": \"$out\"}
