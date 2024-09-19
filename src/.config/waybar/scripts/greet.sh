#~/bin/bash
out="$HOSTNAME: $(shuf -n 1 ~/.config/waybar/scripts/dependencies/motd)"
tt=$(shuf -n 1 ~/.config/waybar/scripts/dependencies/tooltip)
echo {\"text\": \"$out\", \"tooltip\": \"$tt\"}
