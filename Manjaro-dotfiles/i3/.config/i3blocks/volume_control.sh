#!/bin/bash

current_sink_num=$(pacmd list-sinks | awk '/\*/ {print $3}')
SINKNUM=$current_sink_num+1
VOLUMEUP='+5%'
VOLUMEDOWN='-5%'
#VOLUME_LEVEL=$(pacmd list-sinks | awk -v sinkvar="$SINKNUM' '$0 ~ "^"svolume:/{i++} i=='sinkvar'{print $5; exit}')
VOLUME_LEVEL=$(pactl get-sink-volume 1 | awk '{ print $5; exit }')
#echo $VOLUME_LEVEL

pa-set() { 
	# list all apps in playback tab (ex: cmus, mplayer, vlc)
	inputs=($(pacmd list-sink-inputs | awk '/index/ {print $2}')) 
	# set the default output device
	pacmd set-default-sink $1 &> /dev/null
	# apply the changes to all running apps to use the new output device
	for i in ${inputs[*]}; do pacmd move-sink-input $i $1 &> /dev/null; done
}

case $BLOCK_BUTTON in
	#1) langru && notify-send "keyswitch turned on";; # left click
	#1) setxkbmap -option grp:ctrl_alt_toggle us,ru && KBD="eng" ;;
	#1) setxkbmap -option grp:ctrl_alt_toggle us,ru && KBD=get_layouts ;;
	#1) setxkbmap -option grp:ctrl_alt_toggle us,ru ;;
	#3) setxkbmap -option grp:ctrl_alt_toggle ru,us && KBD="rus" ;;
	#2) notify-send "2j";; # 
	#3) notify-send "3";; # right click
	#4) notify-send "$VOLUME_LEVEL" && pactl set-sink-volume $current_sink_num $VOLUMEUP ;; # scroll up
	#1) notify-send "left $((current_sink_num+1))" && pa-set $((current_sink_num+1)) ;; # left click
	1) pa-set $((current_sink_num+1)) ;; # left click
	3) pa-set $((current_sink_num-1)) ;; # right click
	4) pactl set-sink-volume $current_sink_num $VOLUMEUP ;; # scroll up
	#5) notify-send "$VOLUME_LEVEL" && pactl set-sink-volume $current_sink_num $VOLUMEDOWN ;; # scroll down
	5) pactl set-sink-volume $current_sink_num $VOLUMEDOWN ;; # scroll down
esac
#notify-send "message" ;

echo $current_sink_num vol-$VOLUME_LEVEL
