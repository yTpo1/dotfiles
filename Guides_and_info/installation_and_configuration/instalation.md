Step by step instalation and configuration instruction [FOR BIOS]. For uefi drive partitioning and bootloader instalation
sources:
https://www.youtube.com/watch?v=4PBqpX0_UOc
https://wiki.archlinux.org/index.php/Installation_guide

## 1 Pre-installation  
1.1 Set the keyboard layout  
Default is fine  

1.2 Verify the boot mode  
(this is for bios, not uefi)  
to check what if bios/uefi is installed:  
(if ls: connot access, you have bios)  
> $ ls /sys/firmware/efi/efivars  

1.3 Connect to the Internet  
(Check internet connection)  
> $ ping youtube.com  

(if using wifi, not ethernet)  
> $ wifi-menu  
    
1.4 Update the system clock

> $ timedatectl set-ntp true  
    
1.5 Partition the disks  
```
# see what partitions are present
> $ lsblk
# tool for partitioning
> $ fdisk /dev/sd(?)
# see primary partition
> $ p
# delete all old partitions
> $ d
# create new partiotions
> $ n
  # choose primary partition
  >default
  # choose 1-4, default 1
  >defualt
  # first sector
  >default (2048)
  # how big partition to be
  # first is boot. We want 200 megabytes
  +200M
  # if asks to remove signature just say Y
n
  # choose primary partition
  >default 
  # choose 2-4, default 2
  >defualt
  #first sector
  >default
  # Swap. For hybernate computer. Has different recomendations. 150% of ram size. (if 8G ram = 12G swap)
  # Since im doing it for a virtual machine, I can't offer alot of space
  +2G
p
n
  >default
  >default
  # root partition - where all my programs will be, a safe size is 25G. (i used 50 for my pc and 15 for my vm)
  +15G

# home partition
n
  # choose primary
  p
  #use all the rest of the space

# write. Do all the changes
w
```
1.6 Format the partitions

boot
> $ mkfs.ext4 /dev/sd(?)1
 root
> $ mkfs.ext4 /dev/sd(?)3
 home
> $ mkfs.ext4 /dev/sd(?)4
 swap
> $ mkswap /dev/sd(?)2
> $ swapon /dev/sd(?)2

1.7 Mount the file systems

# root
mount /dev/sd(?)3 /mnt

mkdir /mnt/home
mkdir /mnt/boot
mount /dev/sd(?)1 /mnt/boot
mount /dev/sd(?)4 /mnt/home

## 2 Instalation
install arch linux where i tell it to. And install additional packages
> $ pacstrap /mnt base base-devel vim git
    
## 3 Configure the system

3.1 Fstab  
Generate an fstab file.  
Fstab is your operating system’s file system table. Fstab is configured to look for specific file systems and mount them automatically in a desired way each and every time.  
> $ genfstab -U /mnt >> /mnt/etc/fstab  
    
3.2 Chroot  
get out of usb into your arch linux  
> $ arch-chroot /mnt  
    
3.3 Time zone  
> $ ls /usr/share/zoneinfo/  
> $ ls /etc/localtime   

ln - link  
> $ ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
    
    3.4 Localization
    # uncomment. If need multiple lang, uncomment more
    > $ vim /etc/locale.gen
        en_US.UTF-8 UTF-8
        en_US ISO-8859-1
    # read uncommented like and generate
    > $ locale-gen
    # write: 
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
    or
    > $ vim /etc/locale.conf
        LANG=en_US.UTF-8
    
3.3 Seting up a network manager  
By default no arch doesn't have internet access  
> $ pacman -S networkmanager  
telling systemd to automatickly start it  
> $ systemctl enable NetworkManager  
    
3.5 Network configuration  
choose a hostname - the name of the computer  
> $ cat "myarch" > /etc/hostname  
    
    3.6 Initramfs
    3.7 Root password
    #set a password for root
    passwd
    
3.8 Boot loader  
grub as my bootloader  
> $ pacman -S grub  
> $ grub-install --target=i386-pc /dev/sd(?)  
> $ grub-mkconfig -o /boot/grub/grub.cfg  
    
## 4 Reboot
> $ exit  
> $ umount -R /mnt  
> $ reboot  
