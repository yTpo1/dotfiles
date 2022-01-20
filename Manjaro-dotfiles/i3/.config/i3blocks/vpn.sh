#!/bin/bash

STATUS=$(nordvpn status | awk '/Status:/ { print $3 }')

vpnstatus() {
	#STATUSLONG=$(nordvpn status | awk '/Status:/ { print }')
	#STATUS_COUNTRY=$(nordvpn status | awk '/Country:/ { print }')
	COUNTRY=$(nordvpn status | awk '/Country:/ { print $2 }')
	#MERGEINFO="$STATUSLONG$COUNTRY"
	#notify-send $($STATUSLONG + " " + $COUNTRY)
	ST_COUNTRY="$STATUS-$COUNTRY"
	notify-send $ST_COUNTRY
	#notify-send $COUNTRY
	#notify-send $MERGEINFO
	#echo $STATUSLONG + $COUNTRY
}

#vpn_start() {
#	nordvpn Connect Moldova
#	tsm-stop-all
#
#	# Status
#	vpnstatus
#}

case $BLOCK_BUTTON in
	1) vpnstatus ;; # left click
esac

echo VPN: $STATUS
