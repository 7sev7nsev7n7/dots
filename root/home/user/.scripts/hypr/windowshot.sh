# get window dimensions (start/end coords for flameshot)
raw=$(hyprctl activewindow | grep '\(at\|size\):')
pos=(
  "$(awk 'NR==1 { print }' <<<$raw | sed -e 's/\s*at: //' -e 's/,.*//')"
  "$(awk 'NR==1 { print }' <<<$raw | sed -e 's/.*,//')"
)
size=(
  "$(awk 'NR==2 { print }' <<<$raw | sed -e 's/\s*size: //' -e 's/,.*//')"
  "$(awk 'NR==2 { print }' <<<$raw | sed -e 's/.*,//')"
)

# use dimensions to flameshot a region (active window)
case $1 in
  "gui")
    flameshot gui --region "${size[0]}x${size[1]}+${pos[0]}+${pos[1]}"
    ;;

  *)
    flameshot full -c --region "${size[0]}x${size[1]}+${pos[0]}+${pos[1]}"
    ;;
esac
