# Check whether window gaps should be used or not
# Gaps will either use the default configuration or 
# be set to zero

# Get current values
gaps_in=$(hyprctl getoption general:gaps_in | sed '1!d' | grep -oe '[0-9]*$')
gaps_out=$(hyprctl getoption general:gaps_out | sed '1!d' | grep -oe '[0-9]*$')
rounding=$(hyprctl getoption decoration:rounding | sed '1!d' | grep -oe '[0-9]*$')

# If values are non-zero (default configuration) set to zero
# Else reload hyprland.conf

if [ "$gaps_in" == "0"  ]; then
  hyprctl reload
else
  hyprctl --batch "keyword general:gaps_in 0;\
                   keyword general:gaps_out 0;\
		   keyword decoration:rounding 0;"
fi
