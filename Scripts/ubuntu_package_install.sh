#!/bin/bash

# Not in package manager:
# fzf - https://github.com/junegunn/fzf 
# neovim - https://github.com/neovim/neovim
# ccls - https://github.com/MaskRay/ccls

sudo apt install vim
sudo apt install git
sudo apt install gcc
sudo apt install gdb
sudo apt install ctags
sudo apt install make
sudo apt install tmux
sudo apt install curl
# To set as default shell: chsh -s /bin/zsh or chsh -s $(which zsh) and log off or restart pc
sudo apt install zsh
sudo apt install stow
sudo apt install htop
sudo apt install neofetch
sudo apt install sqlite3
sudo apt install nodejs
sudo apt install npm

sudo apt install python3-pip

# curses library need to compile with "$ make"
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt-get install python3-venv
sudo apt install python3-tk

sudo apt install screenkey

sudo apt install pass

sudo apt install adb

sudo apt install newsboat

sudo apt install ranger

sudo apt install zathura
sudo add-apt-repository ppa:spvkgn/zathura-mupdf
sudo apt-get install zathura zathura-pdf-mupdf

# Python global packages
#------------------------
python3 -m pip install flake8

# Ubuntu Specific
# ------------------------------
sudo apt install gnome-tweak-tool
