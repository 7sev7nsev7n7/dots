# $1 will be direction to move (-1,0,+1)
# $2 will be mode to change to
# $3 will (optionally) be the color to set

# variable initialization
path=$(cd "$(dirname "$0")" && pwd) # script path
mode=$2
color=$3

# variable checks
if [[ -z "$@" ]]; then 
	echo "no arguments passed"
	exit
fi

# getting desired mode
modes=('static' 'breathe' 'pulse' 'rainbow-cycle')
current=$(cat $path/current)
if [[ current+$1 -lt 0 || current+$1 -gt 3 ]] ; then # check if value of $1 is within accepted values
	new=$((($current+$1)%4))
	echo $new
else
	new=$(($current+$1))
fi
echo $new > $path/current
mode=${modes[$new]}
echo "changing mode to $mode"

# check if arguments are valid and change color in desired mode
pow=$(cat /sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness)
pows=('off' 'low' 'med' 'high')
case $mode in # if $mode is found in one of lists
	'static'|'breathe'|'pulse')
		col=5 # wal color to use for keyboard
		if [[ -z $color ]]; then # if color argument is not found, use wallpaper color 
			color=$(sed "$col q;d" ~/.cache/wal/colors | sed -e 's/#//')
		fi
		asusctl -k ${pows[$pow]} led-mode $mode -c $color
		;;
	'rainbow-cycle')
		asusctl -k ${pows[$pow]} led-mode $mode
		;;
	*)
		echo 'not found'
		;;
esac
