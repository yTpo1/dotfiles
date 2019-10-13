#!/bin/sh

# Shell
pacman -S zsh

# Text editors
# -------------------
pacman -S vim
#pacman -S neovim
# Tree explorer plugin for navigating the filesystem 
pacman -S vim-nerdtree
# Plugin to browse the tags of the current file and get an overview of its structure
pacman -S vim-tagbar
# powerline for vim written in vim-script
pacman -S vim-airline 
pacman -S vim-airline-themes
# fonts required for powerline
# From AUR install https://aur.archlinux.org/packages/ttf-dejavu-sans-mono-powerline-git/
#pacman -S powerline-fonts
#pacman -S awesome-terminal-fonts

# GUI
pacman -S xorg-server xorg-xinit
pacman -S i3-gaps i3blocks rxvt-unicode dmenu

# Fonts
# Latin script
# Families. (noto-fonts - Unicode)
pacman -S noto-fonts
# Bitstream Vera modified for greater Unicode coverage
pacman -S ttf-dejavu 
#pacman -S ttf-liberation
#ttf-croscore
# Sans-serif. (ttf-linux-libertine - Free substitute for Times New Roman)
pacman -S ttf-linux-libertine
# Monospaced (ttf-inconsolata - inspired by Consolas)
pacman -S ttf-inconsolata

# Emoji and symbols
#pacman -S ttf-joypixels
pacman -S noto-fonts-emoji

#pacman -S ttf-font-awesome
# for FullWidth type of fonts (CJK, latin can't be like that) install Sans fonts
#pacman -S adobe-source-han-sans-otc-fonts
# or 
#pacman -S noto-fonts-cjk

# Development
# -----------
pacman -S bash-completion
pacman -S git
pacman -S openssh
pacman -S python
pacman -S python-pip
#pacman -S nodejs
#pacman -S npm
# dotfiles manager
pacman -S stow
# terminal multiplexer: it enables a number of terminals (or windows), each running a separate program, to be created, accessed, and controlled from a single screen
pacman -S tmux

# Web browsers
# ------------
pacman -S firefox

# File managers
# --------------
# Ranger — Console-based file manager with vi bindings, customizability, and lots of features.
#pacman -S ranger

#pacman -S thunar

# Document Viewers
#--------------------------
pacman -S zathura
pacman -S zathura-pdf-poppler

# System 
# --------------------------
pacman -S unzip
# locate functionality. TODO: run $ sudo updatedb
pacman -S mlocate
# BackUp
pacman -S rsync
# USB mounting
pacman -S udisks2
# System information viewer
pacman -S neofetch
# screenfetch — Similar to archey but has an option to take a screenshot. Written in bash.
#pacman -S creenfetch

# System Task managers
# -------------------
#pacman -S htop
# Lets you user pactree to see package dependencies
#pacman -S pacman-contrib

# Graphical image viewers / Wallpaper setters
# -------------------------------------------
pacman -S feh

# IRC clients
# ----------------
#pacman -S weechat
#pacman -S hexchat

# Database
# --------
#pacman -S sqlite
#pacman -S sqlitebrowser

#pacman -S postgresql
#pacman -S pgadmin4

#pacman -S mariadb
#pacman -S phpmyadmin


# Other:
# ------------
#pacman -S wireshark-qt
#mps-youtube
# to mount and use USB
# https://wiki.archlinux.org/index.php/udisks
#udisks2


# LXAppearance — Desktop independent GTK+ 2 and GTK+ 3 style configuration tool from the LXDE project (it does not require other parts of the LXDE desktop).
# http://wiki.lxde.org/en/LXAppearance || lxappearance
# Arc — A flat theme with a modern look and transparent elements. Includes: Arc, Arc-Dark, Arc-Darker
# https://github.com/nicohood/arc-theme || with transparency: arc-gtk-theme, without transparency: arc-solid-gtk-theme

# xsel is a clipboard manager, I install it because URxvt is not shipped with copy paste by default.
# XSel is a command-line program for getting and setting the contents of the X selection
#pacman -S xsel

# URL and Mouseless text selection for rxvt-unicode
#pacman -S urxvt-perls

#<<<Installed from AUR>>>
# yay
# heroku-cli


# ---------

# Vim markdown
# ------------
# xdg-utils breaks xorg server after restart
#pacman -S xdg-utils
#npm -g install instant-markdown-d
