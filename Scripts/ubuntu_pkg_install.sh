#!/bin/bash

# Requirements for building from source:
sudo apt-get install build-essential
# From source or GUI
# telegram   -
# mpv        - video and audio player
# quod libet - music player
# qbittorrent-
# gimp       - image editor
# st         - https://st.suckless.org/
# fzf        - https://github.com/junegunn/fzf 
# neovim     - https://github.com/neovim/neovim
# ccls       - https://github.com/MaskRay/ccls
# powerline-fonts
# nerd-fonts -

# General development
sudo apt install git
sudo apt install vim
sudo apt install zsh # To set as default shell: chsh -s /bin/zsh or chsh -s $(which zsh) and log off or restart pc
sudo apt install stow
sudo apt install ctags
sudo apt install tmux

# applications
sudo apt install rofi
sudo apt install pass
sudo apt install newsboat
sudo apt install zathura
sudo add-apt-repository ppa:spvkgn/zathura-mupdf
sudo apt-get install zathura zathura-pdf-mupdf
sudo apt install screenkey
sudo apt install curl 

# c/c++ development
sudo apt install gcc
sudo apt install gdb
sudo apt install make

# databases
sudo apt install sqlite3

# system management
sudo apt install neofetch
sudo apt install htop
sudo apt install ranger

# javascript development
sudo apt install nodejs
sudo apt install npm

# python development
sudo apt install python3-pip
# Python global package, for pep8 linting
python3 -m pip install flake8

# curses library need to compile with "$ make"
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt-get install python3-venv
sudo apt install python3-tk

# android
sudo apt install adb

# other
sudo apt-get install libgtk2.0-dev
sudo apt-get install libgtk-3-dev

# Ubuntu Specific
# ------------------------------
sudo apt install gnome-tweak-tool
