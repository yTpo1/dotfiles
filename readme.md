Warning: Make sure none of the files already exists, otherwise the command will not work.

After creating a new user, remove .bash_profile and .bashrc from directory
$ stow *
or 
$ stow * -t ~/

to restow (-R)
$ stow * -R ~/

to remove/delete
$ stow -D * -t ~/
or (if created in git repo):
$ stow -D *

read: https://gist.github.com/jonlaing/26798917e073cc8f799f6d40922d90a0
