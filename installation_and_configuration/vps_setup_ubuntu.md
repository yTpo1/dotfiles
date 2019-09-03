### Step 1
Log in to the vps  
``` $ sudo ssh root@ip_address ```  
Update and upgrade system  
``` $ apt-get update && apt-get upgrade ```  
Sethost name of the machine  
``` $ hostnamectl set-hostname nameofhost(example django-server)  ```  
Below line (127.0....) put:  
ip_address nameofhost (example 1--.--.---.--- django-server)  
```$ vim /ect/hosts ```  
Add a new user:  
```$ adduser newusername  ```  
Add the new user to sudoers:  
```$ adduser newusername sudo ```
```$ mkdir -p /home/username/.ssh ```

Exit and login as the new user.
```$ ssh newusername@id_address ```

### Step 2
In the local machine. In the user home folder (-p make tree of the directory):  
```$ mkdir -p ~/.ssh ```
```$ ssh-keygen -b 4096 ```
move keys to server  
```$ scp ~/.ssh/id_rsa.pub newusername@ip_address:~/.ssh/authorized_keys ```

### Step 3
Setting the permissions of the .ssh/ directory, where owner of the directory has rwx and owner of files has rw
server
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

### Step 4 - Setting up a firewall
```
$ sudo apt-get install ufw  
$ sudo ufw default allow outgoing
```
**!!Warning!!** This can lock you out of your server. You must explicitly allow ssh.
```$ sudo ufw default deny incoming```
Allow ssh
```$ sudo ufw allow ssh```
For testing purposes, allow port 8000
```$ sudo ufw allow 8000```
Enable firewall and rules
```
$ sudo ufw enable  
$ sudo ufw status
```

### Step 5 - move project to server
```
$ git clone  
or  
$ scp -r my_project newusername@ip_address:~/
```
### Step 6 - Setting up a django project
```
$ sudo apt-get install python3-pip   
$ sudo apt-get install python3-venv
```
### Create new virtual environment in project folder
```
$ python3 -m venv django_project/venv  
$ source venv/bin/activate  
$ pip install -r requirements.txt  
```
insert ip address of the server in: ALLOWED_HOSTS = ['IP ADRESS OF THE SERVER']  
add static configurations  
```
$ vim setting.py  
$ python manage.py collectstatic
```
test it out
```$ python manage.py runserver 0.0.0.0:800```

### Step 7 - Installing a server - apache (or ngnx)
```$ sudo apt-get install apache2```
web service gate interface. allows apache to talk to django  
```$ sudo apt-get install libapache2-mod-wsgi-py3```

### Configuring the web server
```
$ cd /etc/apache2/sites-available
$ sudo cp 000-default.conf django_project.conf
$ sudo vim django_project.conf
```
Info: ```<VirtualHost *:80>``` is what will happen when we reach the website, as port 80 is a http port  
To edit: right above ```</VirtualHost>``` add:
```
  Alias /static /home/YOURUSER/YOURPROJECT/static
  <Directory /home/YOURUSER/YOURPROJECT/static>
    Require all granted
  </Directory>

  Alias /media /home/YOURUSER/YOURPROJECT/media
  <Directory /home/YOURUSER/YOURPROJECT/media>
    Require all granted
  </Directory>

  <Directory /home/YOURUSER/YOURPROJECT/YOURPROJECT>
    <Files wsgi.py>
      Require all granted
    </Files>
  </Directory>

  WSGIScriptAlias / /home/YOURUSER/YOURPROJECT/YOURPROJECT/wsgi.py
  WSGIDaemonProcess django_app python-path=/home/YOURUSER/YOURPROJECT python-home=/home/YOURUSER/YOURPROJECT/venv
  WSGIProcessGroup django_app

</VirtualHost>
```
To check validity of apache config file  
``` $ apachectl configtest ```
### Enable the site through apache
a2-apache2 en-enable
```$ sudo a2ensite <django-project>```
disable the default site  
```$ sudo a2dissite 0000-default.conf```
While using sqlite3 database, need to allow read and write rights. Also allow write to media folder.  
:www-data - is the apache user. make apache the group owner on the file.
```
$ sudo chown :www-data <django_project>/db.sqlite3  
$ sudo chmod 664 <django_project>/db.sqlite3  
$ sudo chmown :www-data <django_project>/
$ sudo chmod 775 <django_project>/
$ sudo chown -R :www-data <django_project>/media/
$ sudo chmod -R 775 <django_project>/media
```

### move sensitive info to environment variables (ex. application secret_key, database, email username and pass)

change debug to false  

### Launch server
```
$ sudo service apache2 start  
$ sudo systemctl reload apache2  
$ sudo systemctl restart apache2  
$ sudo service apache2 restart  
```

google: django deployment checklist  
source: https://www.youtube.com/watch?v=Sa_kQheCnds
