#!/bin/bash

hdmi_only()
{
	# xrandr --output HDMI-1 --mode 2560x1440
	xrandr --output HDMI-1 --mode 1920x1080
	xrandr --output eDP-1 --off # Turn laptop screen off
}

laptop_and_hdmi() {
	#xrandr --output eDP-1 --mode 1920x1080
	xrandr --output HDMI-1 --primary --auto --output eDP-1 --auto --left-of HDMI-1
}

reset(){
	xrandr --auto
}

case $BLOCK_BUTTON in
	1) reset ;; # left click
	2) laptop_and_hdmi ;; # middle click
	3) hdmi_only ;; # right click
esac

echo monitor
