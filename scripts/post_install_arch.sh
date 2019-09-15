#!/usr/bin/sh

# Add a new user
useradd -m -g wheel ghost1
passwd ghost1

# GUI
pacman -S xorg-server xorg-xinit
pacman -S i3-gaps i3blocks rxvt-unicode dmenu

# Fonts
pacman -S ttf-linux-libertine ttf-inconsolata
pacman -S noto-fonts

# System time - Network Time Protocol (NTP)
pacman -S ntp
systemctl enable ntpd.service
systemctl start ntpd.service

# Configure i3
pacman -S feh
