### ss command
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
