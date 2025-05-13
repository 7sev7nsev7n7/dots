#~/bin/bash
out="$(playerctl metadata artist) - $(playerctl metadata title)"
case $(playerctl status) in
  Paused) out=" - $out";;
esac
echo {\"text\": \"$out\"}
