#!/usr/bin/sh

# 3.2 Set up time zone
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

# 3.3 Setting up a network manager
# By 
pacman -S networkmanager
# enable it automaticaly through systemd
systemctl enable NetworkManager

# 3.5 Network config
# set up  a hostname
echo "myarch" > /etc/hostname

# 3.8 Boot loader
pacman -S grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
