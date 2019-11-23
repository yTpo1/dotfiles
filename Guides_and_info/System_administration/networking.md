### ip address, ip link (ifconfig replacement)
List IP addresses:  
> $ ip address  
> $ ip address show  

### ss command (netstat replacement)
See used ports:ss 
> ss -tulwn  

-t : Show only TCP sockets on Linux  
-u : Display only UDP sockets on Linux  
-l : Show listening sockets. For example, TCP port 22 is opened by SSHD server.  
-p : List process name that opened sockets  
-n : Don’t resolve service names i.e. don’t use DNS  

To display all Ipv4 tcp sockets that are in "connected" state.
> ss -t4 state established

Links/more: https://www.binarytides.com/linux-ss-command/ , https://vmware.github.io/photon/assets/files/html/3.0/photon_admin/use-ip-and-ss-commands.html

To display a list of network interfaces, run the ss command instead of netstat. To display information for IP addresses, run the ip addr command instead of ifconfig -a. 

### nmap
Improved port mapping file.You can see a much more extensive association between ports and services by looking in this file:  
> $ less /usr/share/nmap/nmap-services

#### Scan Ports with Nmap
The nmap creators actually provide a test server located at: scanme.nmap.org  

#### Look Up Website Information
> $ whois remote_host


https://www.digitalocean.com/community/tutorials/how-to-use-nmap-to-scan-for-open-ports-on-your-vps  
#### Other
You can get a short list of some common ports by typing:  
> $ less /etc/services

