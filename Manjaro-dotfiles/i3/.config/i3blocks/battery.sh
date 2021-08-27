#!/bin/bash

#BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
BAT_NUMBER=1
#BAT=$(acpi -b | grep "Battery $BAT_NUMBER")
BAT=$(acpi -b | awk '/Battery 1/{print substr($0, length($0) - 3, length($0))}')

# Full and short texts
#echo "Battery: $BAT"
#echo "BAT: $BAT"
#echo $BAT
#echo "⚡"$BAT
echo $BAT ⚡

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
