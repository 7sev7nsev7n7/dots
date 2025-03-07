#~/bin/bash
out="$(pamixer --get-volume)"
echo {\"text\": \"$out\"}
