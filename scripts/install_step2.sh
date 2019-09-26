#!/bin/sh
# To be run after Arch Chroot

# Copy file required to run xorg without root
cp ./files/Xwrapper.config /etc/X11/

# 3.3 Time zone
echo " 3.3 Time zone"
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

# 3.4 Localization
echo " 3.4 Localization"
# for some reason, the file isn't copied
#cp ./files/locale.gen /etc/
# so make user make changes on his own
echo "please uncomment lines with en_US*"
vi /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# 3.5 Network configuration
echo " 3.5 Network configuration"
# set up  a hostname
echo "myarch" > /etc/hostname
pacman -S networkmanager
# enable it automaticaly through systemd
systemctl enable NetworkManager

# 3.6 Initramfs
# 3.7 Root password
echo " 3.7 Root password"
echo "Enter root password: "
passwd

# 3.8 Boot loader
echo "3.8 Boot loader"
pacman -S grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
