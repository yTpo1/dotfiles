# SSH - openssh
To start using install openssh (alternatives dropbear or TinySSH).

`$ ssh user@server-address `  
`$ ssh -p port user@server-address `   


### Step 2
On the remote-machine. (`mkdir -p` flag will create nested directories, but only if they don't exist already):  
`$ mkdir -p ~/.ssh `  

On the local-machine.
`$ ssh-keygen -b 4096 `

Move keys to server  
`$ scp ~/.ssh/id_rsa.pub newusername@ip_address:~/.ssh/authorized_keys `  

### Step 3
On remote-machine.
Setting the permissions of the .ssh/ directory, where owner of the directory has rwx and owner of files has rw  
`$ sudo chmod 700 ~/.ssh/`  
`$ sudo chmod 600 ~/.shh/*`

Disallow root logins, and not allow password authentications  
`$ sudo vim /etc/ssh/sshd_config`
1. change:  
  PermitRootLogin yes  
to  
  PermitRootLogin no  
or
    PermitRootLogin=prohibit-password

2. uncomment and change to "no"  
  PasswordAuthentication  

restart ssh service  
`$ sudo systemctl restart sshd`  

