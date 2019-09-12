To add a user:  
> $ sudo useradd -m username  
**-m** Creates the user home directory as /home/username  
**-g** __group__ Set primary group (it must exist in the /etc/group file). Without this option, a new group is created that is the same as the user name and is used as that user's primary group.
**-p** __passwd__ Set a password. It must be an encrypted password. (To generate an encrypted MD5 password, type __openssl passwd__).
> $ sudo passwd username  
