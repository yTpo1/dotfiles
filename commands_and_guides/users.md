Add user:  
> $ sudo useradd -m username  

**-m** Creates the user home directory as /home/username  
**-g group** Set primary group (it must exist in the /etc/group file). Without this option, a new group is created that is the same as the user name and is used as that user's primary group.   
**-p passwd** Set a password. It must be an encrypted password. (To generate an encrypted MD5 password, type __openssl passwd__).  


Set password for a user
> $ sudo passwd username 

Modify user
> $usermod username  

**-l username** change login name  
**-d home_dir** change home directory  
**-g group** change the primary group the user will be in  

Delete user:  
> $userdel -r username
