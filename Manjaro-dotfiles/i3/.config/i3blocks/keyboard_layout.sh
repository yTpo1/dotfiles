#!/bin/bash

VAR=$(xset -q|grep LED| awk '{ print $10 }')

case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000") KBD="eng" ;;
  "00000001") KBD="ENG" ;;
  "00001000") KBD="rus" ;;
  "00001001") KBD="RUS" ;;
  *) KBD="unknown" ;;
esac

get_layouts() {
	echo $(setxkbmap -query | grep layout | awk '{print $2}')
}

#case $BLOCK_BUTTON in
#	#1) langru && notify-send "keyswitch turned on";; # left click
#	#1) setxkbmap -option grp:ctrl_alt_toggle us,ru && KBD="eng" ;;
#	#1) setxkbmap -option grp:ctrl_alt_toggle us,ru && KBD=get_layouts ;;
#	1) setxkbmap -option grp:ctrl_alt_toggle us,ru ;;
#	#3) setxkbmap -option grp:ctrl_alt_toggle ru,us && KBD="rus" ;;
#	#2) notify-send "2j";; # 
#	#3) notify-send "3";; # right click
#	#4) notify-send "4";; # 
#	#5) notify-send "5";; #
#esac
#notify-send "message" ;
#notify-send $(get_layouts) ;
if [[ $(get_layouts) != "us,ru" ]]; then
	setxkbmap -option grp:ctrl_alt_toggle us,ru;
	notify-send "Switched to us,ru";
fi

echo $KBD
