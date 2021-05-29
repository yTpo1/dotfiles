#!/bin/bash

# Requirements for building from source:
sudo apt-get install build-essential
# From source or GUI
# telegram   -
# mpv        - video and audio player
# quod libet - music player
# youtube-dl - https://github.com/ytdl-org/youtube-dl
# qbittorrent-
# gimp       - image editor
# st         - https://st.suckless.org/
# fzf        - https://github.com/junegunn/fzf 
# neovim     - https://github.com/neovim/neovim
# ccls       - https://github.com/MaskRay/ccls
# polybar    - https://github.com/polybar/polybar , install guide: https://gist.github.com/kuznero/f4e983c708cd2bdcadc97be695baacf8
# siji font (required for polybar) - https://github.com/stark/siji
# in case siji doesnt work - moving siji.bdf file to my $HOME/.fonts and fc-cache -f -v
# and maybe deleting or commenting out the file: # rm /etc/fonts/conf.d/70-no-bitmaps.conf
# powerline-fonts
# nerd-fonts -
# docker
# dragon - https://github.com/mwh/dragon # opens file so you can drag and drop
# dropbox - from official site
# KXstudio (music plugins for arour) - https://kx.studio/Repositories

# General development
sudo apt install git
sudo apt install vim
sudo apt install zsh # To set as default shell: chsh -s /bin/zsh or chsh -s $(which zsh) and log off or restart pc
if ! [ -x $(command -v antibody) ]; then
	echo Antibody is not installed, installing.
	curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin # Antibody - plugin manager for zsh
fi
sudo apt install stow
sudo apt install ctags
sudo apt install tmux

# applications
sudo apt install rofi
sudo apt install pass
sudo apt install newsboat
sudo apt install feh
sudo apt install zathura
sudo add-apt-repository ppa:spvkgn/zathura-mupdf
sudo apt-get install zathura zathura-pdf-mupdf
sudo apt install screenkey
sudo apt install curl 
sudo apt install flameshot # screenshot tool
sudo apt install transmission-cli transmission-common transmission-daemon

# is broken on ubuntu
#sudo apt install mpd
#sudo apt install mpc

# email
sudo apt install mutt
sudo apt install neomutt
sudo apt install isync
sudo apt install msmtp

# irc
sudo apt install weechat

# c/c++ development
sudo apt install gcc
sudo apt install gdb
sudo apt install make
sudo apt install valgrind

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
sudo apt install python3
sudo apt install python3-pip
sudo apt-get install python3-venv
# Python global package, for pep8 linting
#python3 -m pip install flake8

# curses library need to compile with "$ make"
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt install python3-tk

# android
sudo apt install adb

# other
sudo apt-get install libgtk2.0-dev
sudo apt-get install libgtk-3-dev

# Ubuntu Specific
# ------------------------------
sudo apt install gnome-tweak-tool

# new other
sudo apt install manpages-posix-dev
sudo apt install unrar
sudo apt install lmms
sudo apt install clementine
sudo apt install whois
sudo apt install urlscan
sudo apt install notmuch
sudo apt install lynx
sudo apt install mariadb-server
sudo apt install apache2
sudo apt install phpmyadmin
sudo apt install libsdl1.2debian libsdl-image1.2 libsdl-ttf2.0-0 libsndfile1 libncursesw5
sudo apt install mpg321 # audioplayer and mp3 to wav converter
sudo apt install audacity
sudo apt install easytag
sudo apt install openbox
sudo apt install obconf
sudo apt install mpd
sudo apt install cantata
sudo apt install mpc

sudo apt install pwgen # password generation

# Music creation
sudo apt install lv2-dev
sudo apt install lilv-utils # usefull command lv2ls - for listing installed lv2 plugins
sudo apt install calf-ladspa # this needs to be installed before calf-plugins
sudo apt install calf-plugins # based on LV2

sudo apt install nomacs
sudo apt install libreoffice-calc
sudo apt install bpm-tools
sudo apt install openshot
sudo apt install flowblade
sudo apt-get install libheif-examples # convert iphone HEIC files to jpg
# for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done
