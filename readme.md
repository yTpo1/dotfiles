Step by step instalation and configuration instruction

1 Pre-installation

    1.1 Set the keyboard layout
    
    1.2 Verify the boot mode
    
    (this is for bios, not uefi)
    to check what if bios/uefi is installed:
    ls /sys/firmware/efi/efivars
    (if ls: connot access, you have bios)

    1.3 Connect to the Internet
    (Check internet connection)
    ping youtube.com

    (if using wifi, not ethernet)
    wifi-menu
    
    1.4 Update the system clock
    
    timedatectl set-ntp true
    
    1.5 Partition the disks
    
    # see what partitions are present
    lsblk
    # tool for partitioning
    fdisk /dev/sdb
    # see primary partition
    p
    # delete all old partitions
    d
    # create new partiotions
    n
      # choose primary partition
      >default
      # choose 1-4, default 1
      >defualt
      # how big partition to be
      # first is boot. We want 200 megabytes
      +200M
      # if asks to remove signature just say Y
    n
      # choose primary partition
      >default 
      # choose 2-4, default 2
      >defualt
      # Swap. For hybernate computer. Has different recomendations. 150% of ram size. 
      # Since im doing it for a virtual machine, I can't offer alot of space
      +2G
    p
    n
      >default
      >default
      # root partition
      +15G
    n
      p
      #home partition
      #use all the rest of the space
      
    # write. Do all the changes
    w
    
    1.6 Format the partitions
    
    # boot
    mkfs.ext4 /dev/sdb1
    # root
    mkfs.ext4 /dev/sdb3
    # home
    mkfs.ext4 /dev/sdb4
    # swap
    mkswap /dev/sdb2
    swapon /dev/sdb2
    
    1.7 Mount the file systems
    
    # root
    mount /dev/sdb3 /mnt
    
    mkdir /mnt/home
    mkdir /mnt/boot
    
    mount /dev/sdb1 /mnt/boot
    mount /dev/sdb4 /mnt/home
    
    

