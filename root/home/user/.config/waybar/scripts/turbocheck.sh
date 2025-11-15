#~/bin/bash
# path should be changed depending on system
turbo=$(cat /sys/devices/platform/asus-nb-wmi/platform-profile/platform-profile-0/profile)

echo {\"alt\": \"$turbo\", \"tooltip\": \"$turbo mode\",}
