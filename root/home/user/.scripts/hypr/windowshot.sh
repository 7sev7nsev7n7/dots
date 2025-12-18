# get window position and dimensions
raw="$(hyprctl activewindow)"
pos=(
  $((-4+"$(sed -e '1,3d;s/\s*at: //;s/,.*//;q' <<<$raw )"))
  $((-4+"$(sed -e '1,3d;s/.*,//;q' <<<$raw )"))
)
size=(
  $((8+"$(sed -e '1,4d;s/\s*size: //;s/,.*//;q' <<<$raw )"))
  $((8+"$(sed -e '1,4d;s/.*,//;q' <<<$raw )"))
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
