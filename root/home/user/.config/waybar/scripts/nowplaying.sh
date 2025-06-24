#~/bin/bash

# get values for artist and track title
artist="$(playerctl metadata artist | sed -e 's/ - \(T\|t\)opic//')"
title="$(playerctl metadata title)"

# join artist and title
out="$artist - $title"

# check whether track is playing
case $(playerctl status) in
  # show pause icon if track is paused
  "Paused") out=" - $out"
    ;;
  # show nothing if track is not playing
  "") out=""
    ;;
esac

echo {\"text\": \"$out\"}
