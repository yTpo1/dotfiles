## Loging
> journalctl

**-r** to see latest logs

## Times
https://coreos.com/os/docs/latest/scheduling-tasks-with-systemd-timers.html  
#### Listing timers
You can also list all timers enabled in your system using  
> $ systemctl list-timers  
**--all** to list all timers.   

#### Enabling/Stopping timers
> $ systemctl start *.timer   
> $ systemctl stop *.timer  

#### Creating timers
1. Create a *.service file. Example:
```
[Unit]
Description=Prints date into /tmp/date file

[Service]
Type=oneshot
ExecStart=/usr/bin/sh -c '/usr/bin/date >> /tmp/date'
```
2. Create *.date file. Example:  
```
[Unit]
Description=Run date.service every 10 minutes

[Timer]
OnCalendar=*:0/10
```
This config will run date.service every 10 minutes.  

