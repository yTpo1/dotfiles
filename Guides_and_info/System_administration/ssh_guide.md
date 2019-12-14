To start using install openssh (alternatives dropbear or TinySSH).

$ ssh user@server-address
$ ssh -p port user@server-address

### Step 2
In the local machine. In the user home folder (-p make tree of the directory):  
```$ mkdir -p ~/.ssh ```
```$ ssh-keygen -b 4096 ```  
move keys to server  
```$ scp ~/.ssh/id_rsa.pub newusername@ip_address:~/.ssh/authorized_keys ```

### Step 3
Setting the permissions of the .ssh/ directory, where owner of the directory has rwx and owner of files has rw  server
```
$ sudo chmod 700 ~/.ssh/                                                                                        
$ sudo chmod 600 ~/.shh/*
```
dis-allow root logins, and not allow password authentications                                                   
```$ sudo vim /etc/ssh/sshd_config```
1. change:  
  PermitRootLogin yes                                                                                           
to  
  PermitRootLogin no                                                                                            
2. uncomment and change to "no"                                                                                 
  PasswordAuthentication  

restart ssh service                                                                                             
```$ sudo systemctl restart sshd```
