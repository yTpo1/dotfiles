#!/usr/bin/sh

# Add a new user
echo "Creating user ghost1"
useradd -m -g wheel ghost1
echo "Enter password for ghost1"
passwd ghost1
# copy file in which group wheel is given sudo rights
#cp files/sudoers /etc/

# Install packages
#echo "Install packages"
#./package_installation.sh

# System time - Network Time Protocol (NTP)
pacman -S ntp
# Enable it at boot
systemctl enable ntpd.service
# Start it immediately
#systemctl start ntpd.service


# GUI
#pacman -S xorg-server xorg-xinit
#pacman -S i3-gaps i3blocks rxvt-unicode dmenu
# Fonts
#pacman -S ttf-linux-libertine ttf-inconsolata
#pacman -S noto-fonts
# Configure i3
#pacman -S feh
