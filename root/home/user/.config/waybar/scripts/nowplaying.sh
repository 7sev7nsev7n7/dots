#~/bin/bash
out="$(playerctl metadata title)"
echo {\"text\": \"$out\"}
