## Managing USB and Removable Devices

Mounting

Without sudo. Using udiscksctl  (package - udisks2)  
> $ lsblk  
> $ udisksctl mount -b /dev/sd?  
> $ udisksctl unmount -b /dev/sd?  

With sudo  
> $ sudo mount /dev/sd? /mnt   
> $ sudo umount /dev/sd?  

## Check information about hardware components  
List PCI buses and devices connected to them  
> $  lspci  

or  
> $ dmesg | less  

List information about computes USB hubs along with any USB devices connected to the computers USB ports:  
> $ lsusb

## Loadable modules
If you have added hardware to your computer that isn't properly detected, you might need to manually load a module for that hardware. Linux comes with a set of commands for loading, unloading, and getting information about hardware modules.  

Kernel modules are installed in /lib/modules/ subdirectories. The name of each subdirectory is based on the release number of the kernel. For example, if the kernel were 3.1.0-7.fc15.i343, the lib/modules/3,1,0-7.fc15.i343 durectory would contain drivers for that kernel. Modules in those directories can then be loaded and unloaded as they are needed.  

Listing loaded modules  
> $ lsmod

Find information about a loaded module  
> $ /sbin/modinfo -d snd-seq-oss  

Loading modules  
> $ modprobe name   

Removing modules  
> $ rmod name   

Remove modules and all that depend on them
> $ rmod -r name

## Other
Logging with systemd
> $ journalctl

Burn an ISO File to a USB Stick  
> $ sudo dd bs=4M if=/path/to/manjaro.iso of=/dev/sd[drive letter] status=progress  
