#!/bin/bash

#BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
BAT=""
BAT_NUMBER=1
#BAT=$(acpi -b | grep "Battery $BAT_NUMBER")
#BAT=$(acpi -b | awk '/Battery 1/{print substr($0, length($0) - 3, length($0))}')
BAT_STATUS=$(acpi -b)
# if battery 1 exists
if grep -q "Battery 1: Charging" <<< $BAT_STATUS; then
	BAT="Charging"
	# acpi -b | awk '{print substr($0,10,40) }'
elif grep -q "Battery 1" <<< $BAT_STATUS ; then
	BAT=$(echo $BAT_STATUS | awk '/Battery 1/{print substr($0, length($0) - 3, length($0))}')
elif grep -q "Battery 0: Charging" <<< $BAT_STATUS ; then
	BAT=$(echo $BAT_STATUS | awk '{print substr($0,21) }')
else
	#BAT=$(echo $BAT_STATUS | awk '{print substr($15,24) }')
	#BAT=$(echo $BAT_STATUS | awk '{print substr($0,24) }')
	BAT=$(echo $BAT_STATUS | awk '{ print $4 ;}')
fi

case $BLOCK_BUTTON in
	1) notify-send $(acpi -b | awk '/Battery 1/') ;; # left click
esac


# Full and short texts
#echo "Battery: $BAT"
#echo "BAT: $BAT"
#echo $BAT
#echo "⚡"$BAT
echo $BAT ⚡

# doesn't work with battary 0
# Set urgent flag below 5% or use orange below 20%
#[ ${BAT%?} -le 5 ] && exit 33
#[ ${BAT%?} -le 20 ] && echo "#FF8000"

#exit 0
