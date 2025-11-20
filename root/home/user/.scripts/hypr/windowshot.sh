# get window dimensions (start/end coords for flameshot)
raw="$(hyprctl activewindow)"
pos=(
  "$(sed -e '1,3d;5,$d;s/\s*at: //;s/,.*//' <<<$raw )"
  "$(sed -e '1,3d;5,$d;s/.*,//' <<<$raw )"
)
size=(
  "$(sed -e '1,4d;6,$d;s/\s*size: //;s/,.*//' <<<$raw )"
  "$(sed -e '1,4d;6,$d;s/.*,//' <<<$raw )"
)
region="${size[0]}x${size[1]}+${pos[0]}+${pos[1]}"

# use dimensions to flameshot a region (active window)
case $1 in
  "gui")
    flameshot gui --region $region
    ;;

  *)
    flameshot full -c --region $region
    ;;
esac
