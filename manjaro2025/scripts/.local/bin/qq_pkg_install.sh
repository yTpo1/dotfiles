#!/usr/bin/bash

# Variables
LINE="\n--------------------------"
AUR_DOWNLOAD_DIR="$HOME/AUR_Package_downloads"

# $1 package
# $2 Description
# $3 App(alt) name after installation
install() {
	Appname=$1
	if [ $# -eq 3 ]; then
		Appname=$3
	fi

    if ! type $Appname &> /dev/null; then
		printf "Installing $1. | $2 $LINE"
		sudo pacman -S $1
	fi
}

# Difference between this function and install() is:
# this is for programs that don't have a runnable app and can only be found through pacman
# ToDo: merge with the function above and remove repetition
# $1 package
# $2 Description
installPacman() {
	if ! pacman -Q $1 &> /dev/null; then
		printf "Installing $1.| $2 $LINE"
		sudo pacman -S $1
	fi
}

# $1 AUR git repo link
# $2 Description
# $3 App (alt)name after installation
installAUR() {
	if ! type $3 &> /dev/null; then
		echo "Installing $3 from AUR. | $2"
		echo "--------------------------"
		git clone $1 "$AUR_DOWNLOAD_DIR"/$3
		cd "$AUR_DOWNLOAD_DIR"/$3
		makepkg -si
	fi
}

# $1 AUR git repo link
# $2 Description
# $3 Package name
installAURPacman() {
	if ! pacman -Q $3 &> /dev/null; then
		echo "Installing $3 from AUR. | $2"
		echo "--------------------------"
		git clone $1 ~/Downloads/AUR_$3
		cd ~/Downloads/AUR_$3
		makepkg -si
	fi
}

printf "$LINE \nUpdating the system $LINE\n"
sudo pacman -Syu

printf "$LINE \nInstalling new software packages $LINE\n"

# 0 Essential for setup
install fakeroot

# 1 Internet

# 1.2 Web Browsers
install firefox
install chromium

# 1.3 Web servers
#installPacman apache
#install nginx

# 1.4 File Sharing
install yt-dlp "ytdl"


# 1.4.4 Cloud synchronization clients
installPacman python-gpgme # Required for dropbox
installAUR "https://aur.archlinux.org/dropbox.git" "-" dropbox
#installAURPacman "https://aur.archlinux.org/thunar-dropbox.git" "Dropbox extension for Thunar" thunar-dropbox

# 1.4.6 BitTorrent clients
if ! type transmission-remote &> /dev/null; then
	echo "Installing Transmission Daemon and Cli"
	sudo pacman -S transmission-cli 

	echo "Adding my user to the transmission group so that I can access "
	sudo usermod -a -G transmission $USER

	printf "enabling and starting transmission service\n"
	sudo systemctl enable transmission.service
	sudo systemctl start transmission.service
fi

# 1.5.5 Instant messaging clients
#install discord
install telegram-desktop

# 2 Multimedia
# 2.1 Codecs
install flac

# 2.2 Image
# 2.2.4 Raster graphics editors
install gimp

# 2.2.12 Screenshot
install flameshot

# 2.3 Audio
# 2.3.2 Audio players
# 2.3.2.3 
install audacious

# 2.3.5 Audio tag editors
install easytag

# 2.3.9 Digital audio workstations
#installPacman ardour
#install calf "Category: music pluggins" calfjackhost
#install carla "Category: music pluggins"
#install hydrogen "Category: music pluggins"
#install mscore "Sheet music. Old name: musescore"
# ugly interface, one from aur is better
# #install zynaddsubfx "Category: music pluggins"
#installAURPacman https://aur.archlinux.org/avldrums-lv2-git.git "Extension for Ardour and music making" avldrums-lv2-git 
#installAUR "https://aur.archlinux.org/zyn-fusion.git" "Category: music" zyn-fusion
#installAURPacman https://aur.archlinux.org/lingot.git "A musical instrument tuner" lingot
#installAURPacman "https://aur.archlinux.org/calf-ladspa.git" "Music" calf-ladspa

# ----- Just download, no install -------
# https://www.auburnsounds.com/products/Graillon.html

# 2.4 Video
# 2.4.1 Video Players
install vlc

# 3.1 Terminal
# 3.1.1 Command shells
#install zsh
#if [ $SHELL != "/usr/bin/zsh" ]; then
#	    echo Current shell not zsh, changing:; 
#		    chsh -s $(which zsh)
#fi
#if ! type antibody &> /dev/null; then
#	    printf "Installing zsh plugin manager - Antibody\n\n"
#		    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin 
#			    printf "Installing zsh plugins\n\n"
#				    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
#fi
#install fzf "Search command line history with <CTRL+R>"

# 3.1.2 Terminal emulators
install alacritty

# 3.1.4 Terminal multiplexers
install tmux

# 3.2 Files
# 3.2.1 File Managers
#install nautilus
install thunar
install catfish "Search tool for Thunar"
installPacman tumbler "Image thumbnail previewer"

# 3.2.3 File synchronization and backup
install rsync

# 3.3 Development
# -------- Programming Languages and Environments ------
#if ! type python &> /dev/null; then
#	echo "Installing python"
#	sudo pacman -S python
#
#	echo "Additional install for coc-nvim python ultisnips"
#	python3 -m pip install --user --upgrade pynvim
#fi
#install node "NodeJS"
#install npm "For NodeJS"
#install docker "Virtualization, Sandboxing"
#install docker-compose "an alternate CLI frontend for the Docker Engine"
#install php
#installPacman php-apache

# Java - uninstalled it as I never use it
#installPacman jre8-openjdk "Java"
#installPacman java-runtime-common "(containing common files for Java Runtime Environments)"
#installPacman java-environment-common "(containing common files for Java Development Kits)" 

# Uninstalled R as I never used it
#installPacman r

# Dot Net
#installPacman dotnet-runtime-6.0
#installPacman dotnet-sdk-6.0
#installPacman aspnet-runtime-6.0

# Entity framework - used to generate EF Core migrations
# dotnet tool install -g dotnet-ef

#if ! type dotnet &> /dev/null; then
#	echo "Installing .NET runtime"
#	sudo pacman -S dotnet-runtime
#	echo "Installing ASP.NET Core SDK"
#	sudo pacman -S dotnet-sdk
#	echo "Installing ASP.NET Core runtime"
#	sudo pacman -S aspnet-runtime
#
#	echo "dotnet development packages"
#	dotnet tool install -g dotnet-aspnet-codegenerator
#fi

# 3.3.2 Version control systems
install git

# 3.6 System
# 3.6.1 Task managers
install htop

# 3.6.17 System management
#install stow "Dotfiles Setup"
#if [ ! -L ~/.zshrc ]; then # -L returns true if the "file" exists and is a symbolic link
#	#cd ~/Documents/dotfiles/manjaro-dotfiles/
#	cd ~/Documents/dotfiles-master/Manjaro-dotfiles/
#	pwd
#	if [ -e ~/.zshrc ]; then # -e (returns true if file exists regardless of type
#	    echo "Deleting .zshrc"
#	    rm ~/.zshrc
#	fi
#	echo "Stow creating symlinks"
#	stow * -t ~/
#	cd -
#fi

# 4. Documents and texts
# 4.1 Text Editor
install vim
install nvim
# if [ ! -e "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
# 		echo "Installing Plug - plugin manager for neovim"
# 			sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
# 				       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# fi
#install ctags
#install dos2unix

installAUR "https://aur.archlinux.org/visual-studio-code-bin.git" "Microsoft-branded VSCode release (need it to debug C#)" code # package name visual-studio-code-bin

# 4.2 Office
# libreoffice includes:
# LibreOffice Draw — Vector graphics editor and diagramming tool included in the LibreOffice suite similar to Microsoft Visio.
#install libreoffice-still "Libre Office suite" libreoffice 
#install hunspell "Spell checker and morphological analyzer library and program"
#installPacman hunspell-en_us
#installPacman hunspell-en_gb
#installPacman hyphen "library for high quality hyphenation and justification"
#installPacman hyphen-en
#installPacman libmythes "a simple thesaurus"
#installPacman mythes-en

# uninstalled as it didn't work for russian
#installAURPacman "https://aur.archlinux.org/libreoffice-extension-languagetool.git" "Grammar checking for LibreOffice" libreoffice-extension-languagetool

# 4.2.5 Database tools
#install sqlite "-" sqlite3

#install mariadb # mysql
#installPacman phpmyadmin

#installPacman postgresql

# 4.3 Markup languages
# 4.3.2 Markdown
# 4.3.2.3 Markdown editors
#install ghostwriter

# Uninstalling as I never used it
#install marker
#install zettlr

# 4.4 Document Converter
#install pandoc
# latex
#installPacman texlive-most "contains most TeX Live packages" # error: this package was not found..

#installPacman texlive-core "LaTeX. includes major TeX-related programs, macro packages, and fonts. Will allow pdf conversion for pandoc"
#installPacman texlive-core ""
#installPacman texlive-most "LaTex. Includes: texlive-core, texlive-bin, texlive-latexextra"

# Installed. but keeps showing up when running this script so commenting out for now
#installPacman texlive-lang "group contains packages providing character sets and features for languages with non-Latin characters. I've only installed cyrillic"

# 4.6 Readers and viewers

# Uninstalling as I never used it
# install evince "Document viewer for GNOME using GTK" # not epub

# 4.6.2 E-book

# Uninstalling as I never used it
#install fbreader # should be epub

# 4.6.3 Comic book
# install mcomix "Manga/Comix reader" # dont care anymore

# 4.10.4 Mind-mapping
# Uninstalling as I never used it
#install freeplane 

# 5.8 Password managers
install pass
install pwgen "Password Generator"

# 7 Others

# 7.4 Display managers / login manager
#if ! type lightdm &> /dev/null; then
#	echo "Installing lightdm - Login Manager/Display Manager"
#	sudo pacman -S lightdm
#	echo "Installing lightdm Greeter - GUI that prompts the user for credentials"
#	sudo pacman -S lightdm-slick-greeter
#	sudo systemctl enable lightdm
#fi

# 7.5 Desktop environments
# 7.5.1 Window managers
#installPacman i3-gaps

# 1.5.4 Taskbars
#install i3blocks

# 7.5.4 Taskbars
#installAUR "https://aur.archlinux.org/polybar.git" "-" polybar

# 7.5.6 Application launchers
install rofi

# 8 Other
#install adb "Android debugger"
#install xorg-xbacklight "tool to control screen brightness" xbacklight

# ----- Manjaro specific -----
if [ ! -e /etc/modprobe.d/nobeep.conf ]; then
	printf "Disable bios *beep* sounds on backspace\n\n"
	echo nobeep.conf does not exist, creating
	sudo sh -c "echo 'blacklist pcspkr' > /etc/modprobe.d/nobeep.conf"
fi
