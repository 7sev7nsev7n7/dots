#~/bin/bash
turbo=$(asusctl profile -p | tail -n 1 | sed -e "s/Active profile is //")
curfile=$( cd $(dirname $0) && pwd)/current

echo $turbo > $curfile
echo {\"alt\": \"$turbo\", \"tooltip\": \"$turbo mode\",}
