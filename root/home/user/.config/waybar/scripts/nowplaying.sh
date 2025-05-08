#~/bin/bash
out="$(playerctl metadata title)"
case $(playerctl status) in
  Paused) out=" - $out";;
esac
echo {\"text\": \"$out\"}
