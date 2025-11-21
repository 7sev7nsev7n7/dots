# get window position and dimensions
raw="$(hyprctl activewindow)"
pos=(
  $((-4+"$(sed -e '1,3d;5,$d;s/\s*at: //;s/,.*//' <<<$raw )"))
  $((-4+"$(sed -e '1,3d;5,$d;s/.*,//' <<<$raw )"))
)
size=(
  $((8+"$(sed -e '1,4d;6,$d;s/\s*size: //;s/,.*//' <<<$raw )"))
  $((8+"$(sed -e '1,4d;6,$d;s/.*,//' <<<$raw )"))
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
