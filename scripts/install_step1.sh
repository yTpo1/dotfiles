#!/usr/bin/sh

# Numeration in accordance with archwiki. 
# 1 Pre-installation
# 1.1 Verify signature
# 1.2 Boot the live environment
# 1.3 Set the keyboard layout
# 1.4 Verify the boot mode
# 1.5 Connect to the internet
# 1.6 Update the system clock
echo " 1.6 Update the system clock"
timedatectl set-ntp true

# 1.7 Partition the disks
echo "Starting disk partitioning of /dev/sda with fdisk"
fdisk /dev/sda

# 1.8 Format the partitions
echo " 1.8 Format the partitions"
read -n1 -p "Does a 4th partition exist?" answer
case $answer in
    y|Y) mkfs.ext4 /dev/sda4 ;;
    *) echo "sda4 does not exist" ;;
esac
# boot
mkfs.ext4 /dev/sda1
# root
mkfs.ext4 /dev/sda3
# swap
mkswap /dev/sda2
swapon /dev/sda2

# 1.9 Mount the file systems
echo " 1.9 Mount the file systems"
# root
mount /dev/sda3 /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
case $answer in
    y|Y) mount /dev/sda4 /mnt/home ;;
    *) echo "sda4 does not exist" ;;
esac

# 2 Installation
# 2.1 Select the mirrors
# 2.2 Install the base packages
echo " 2.2 Install the base packages"
pacstrap /mnt base base-devel vim git

# 3 Configure the system
echo "3 Configure the system"
# 3.1 Fstab
echo " 3.1 Fstab"
genfstab -U /mnt >> /mnt/etc/fstab

# 3.2 Chroot
echo " 3.2 Chroot"
cp -R install_step2.sh /mnt/root/
arch-chroot /mnt
