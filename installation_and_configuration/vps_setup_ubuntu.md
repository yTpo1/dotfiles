Log in to the vps  
> $ sudo ssh root@ip_address  
Update and upgrade system  
> $ apt-get update && apt-get upgrade
Sethost name of the machine  
> $ hostnamectl set-hostname nameofhost(example django-server)  
> $ vim /ect/hosts 
Below line (127.0....) put:  
> ip_address nameofhost (example 1--.--.---.--- django-server)  

Add a new user:
$ adduser newusername

Add the new user to sudoers:
$ adduser newusername sudo

# mkdir -p /home/username/.ssh

Exit and login as the new user.
# ssh newusername@id_address

<-------------------------------------------->
In the local machine:
In the user home folder (-p make tree of the directory):
$ mkdir -p ~/.ssh

local_machine 
$ ssh-keygen -b 4096

move keys to server 
local_machine  
$ scp ~/.ssh/id_rsa.pub newusername@ip_address:~/.ssh/authorized_keys
<-------------------------------------------->

Setting the permissions of the .ssh/ directory, where owner of the directory has rwx and owner of files has rw
server  
$ sudo chmod 700 ~/.ssh/
$ sudo chmod 600 ~/.shh/*

not allow root logins, and not allow password authentications
$ sudo vim /etc/ssh/sshd_config
1. change: 
  PermitRootLogin yes
to
  PermitRootLogin no
2. unccoment and change to "no"
  PasswordAuthentication

restart ssh service
$ sudo systemctl restart sshd

-------------------------------
<<__ Setting up a firewall __>>
-------------------------------
$ sudo apt-get install ufw

$ sudo ufw default allow outgoing

!!Warning!! This can lock you out of your server. You must explicitly allow ssh.
$ sudo ufw default deny incoming

Allow ssh
$ sudo ufw allow ssh

To test, allow port 8000
$ sudo ufw allow 8000

Enable firewall and rules
$ sudo ufw enable

$ sudo ufw status

------------------
<<__ move project to server __>>
------------------
$ git clone
or
$ scp -r my_project newusername@ip_address:~/

------------------
<<__ Setting up a django project __>>
------------------
$ sudo apt-get install python3-pip
$ sudo apt-get install python3-venv

<-----Create new virtual environment in project folder------>
$ python3 -m venv django_project/venv
$ source venv/bin/activate
$ pip install -r requirements.txt
insert ip address of the server in: ALLOWED_HOSTS = ['IP ADRESS OF THE SERVER']
add static configurations
$ vim setting.py
$ python manage.py collectstatic
test it out
$ python manage.py runserver 0.0.0.0:800

------------------
<--- Installing a server - apache (apache or ngnx)  --->
------------------
$ sudo apt-get install apache2
web service gate interface. allows apache to talk to django 
$ sudo apt-get install libapache2-mod-wsgi-py3

<--- Configuring the web server --->
$ cd /etc/apache2/sites-available
$ sudo cp 000-default.conf django_project.conf

$ sudo vim django_project.conf
Info: <VirtualHost *:80> is what will happen when we reach the website, as port 80 is a http port  
To edit: right above "</VirtualHost>" add:
  Alias /static /home/username/projectname/static
  <Direcotry /home/username/projectname/static>
    Require all granted
  </Directory>
  
  Alias /static /home/username/projectname/media
  <Direcotry /home/username/projectname/media>
    Require all granted
  </Directory>
  
  <Direcotry /home/myusername/projectname/django_project>
    <Files wsgi.py>
      Require all granted
    </Files>
  </Directory>
  
  # here / is the base url path we will serve in the application 
  # indicates our root url
  # /home/.. is the full path to wsgi
  WSGIScriptAlias / /home/myusername/django_project/mydjango_project/wsgi.py
  # python-home is the location of the virtual environment
  WSGIDaemonProcess django_app python-path=/home/myusername/django_project python-home=/home/myusername/mydjango_project/venv
  WSGIProcessGroup django_app

--------------------------------------
source: https://www.youtube.com/watch?v=Sa_kQheCnds
