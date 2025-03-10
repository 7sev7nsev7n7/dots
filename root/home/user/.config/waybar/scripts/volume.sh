#~/bin/bash
if [ "$(pamixer --get-mute)" == "false" ]; then
	out=" $(pamixer --get-volume)"
else
	out=""
fi
echo {\"text\": \"$out\"}
