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
```$ sudo ufw delete allow 8000```  
Entable http or port 80  
```$ sudo ufw allow http```  
Enable firewall and rules  
```
$ sudo ufw enable  
$ sudo ufw status
```  
### change default port number
```$ vim /etc/ssh/sshd_config ```  
Locate the following line: **# Port 22**. Remove # and change 22 to desired port number.  
```$ service sshd restart```  

You can see all ports and their service names in the file "/etc/services".  

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
``` $ sudo apachectl configtest ```  
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

### Set Up a Custom Domain Name  
https://www.linode.com/docs/platform/manager/dns-manager/  
1. Register (purchase) a domain name if you haven’t already. (namecheap, domains.google.com, goddady)  
2. Set your domain name to use Linode’s name servers. You’ll need to do this on your domain registrar’s website and then wait up to 24 hours for the change to take effect.  
3. Use the DNS Manager to add a domain, and then start adding some basic DNS records.  
> Go to domains. Click add domain. Add an AAAA Record:  
> hostname - www  
> ip address - (the ip address of the server)  
4. Set reverse DNS.  
> Go to linodes. Go to sever. Go to networking. Go to IPv4 address. Edit RDNS. Paste in domain name (with or without www).  
5. If you have any special DNS requirements, such as when using a third-party email server, add additional DNS records for your specific needs.  
6. SSH into server. Go to django settings.py, in allowed_hosts add domain name.  
Restart server $ sudo service apache2 restart  
7. (if site isn't reacheble without www) Go to domains. Edit DNS records. add another AAAA with ip address but no www.  

### Set Up a SSL/TLS Certificate and enable HTTPS  
Using service LetsEncrypt https://letsencrypt.org/  
With shell access use certbot client. https://certbot.eff.org/ Choose apache and ubuntu.   Follow the given instructions.  
```
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository universe
$ sudo add-apt-repository ppa:certbot/certbot
$ sudo apt-get update
$ sudo apt-get install certbot python-certbot-apache 
```
Change config file in /etc/apache2/sites-available/<django_project>.conf:  
uncomment and change to ServerName www.<mywebsite>.com  
comment-out 3 WSGI lines.  
  
```$ sudo certbot --apache ```  
Enter email, and go through togles.  
```$ sudo certbot renew --dry-run```   

Change configuration - remove aliases and configuration and commented WSGI commands:   
```$ sudo vim /etc/apache2/sites-available/<django_project>.conf ```  
Change configuration - uncomment out WSGI commands:  
```$ sudo vim /etc/apache2/sites-available/<django_project>-le-ssl.conf ```  
To check validity of apache config file  
```$ sudo apachectl configtest ```  
Allow HTTPS trafic in the firewall  
```$ sudo ufw allow https```  
Restart web server  
```$ sudo systemctl restart apache2.service```   

### Set Up automatic SSL/TLS Certificate renewal  
```$ sudo crontab -e```  
Insert:  
``` 30 4 1 * * sudo certbot renew --quiet ```   

### Remove access to http
``` $ sudo ufw delete allow http ```  

google: django deployment checklist  
source: https://www.youtube.com/watch?v=Sa_kQheCnds , https://www.youtube.com/watch?v=D2lwk1Ukgz0&t=838s , https://www.linode.com/docs/platform/manager/dns-manager/
