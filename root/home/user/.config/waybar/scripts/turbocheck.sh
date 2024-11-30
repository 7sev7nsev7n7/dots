#~/bin/bash
turbo=$(cat /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy)
curfile=$( cd $(dirname $0) && pwd)/current

if [[ $turbo == 0 ]]; then
	tt="Balanced"
elif [[ $turbo == 1 ]]; then
	tt="Turbo"
elif [[ $turbo == 2 ]]; then
	tt="Silent"
fi

if [[ "$turbo" != "$(cat $curfile)" ]]; then
	dunstify -a "$HOSTNAME" "Changed performance mode to $tt"  &
fi
echo $turbo > $curfile
echo {\"alt\": \"$turbo\", \"tooltip\": \"$tt mode\",}
