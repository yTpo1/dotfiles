To configure use _ in dotfiles directory. Warning: Make sure none of the files already exists, otherwise the command will not work.
$ stow *
or 
$ stow * -t ~/

to restow (-R)

to remove/delete
$ stow -D * -t ~/
or (if created in git repo):
$ stow -D *


ToDo:
write script to delete files that will be simlinked by stow
