#!/usr/bin/bash

# ----- Just download, no install -------
# https://www.auburnsounds.com/products/Graillon.html


install() {
    # $1 package
	# $2 Description
	# $3 App(alt) name after installation
	Appname=$1
	if [ $# -eq 3 ]; then
		Appname=$3
	fi

    if ! type $Appname &> /dev/null; then
		echo "Installing $1. | $2"
		echo "--------------------------"
		sudo pacman -S $1
	fi
}

installPacman() {
	if ! pacman -Q $1 &> /dev/null; then
		echo "Installing $1.| $2"
		sudo pacman -S $1
	fi
}

installAUR() {
    # $1 AUR git repo link
	# $2 Description
	# $3 App(alt) name after installation

	if ! type $3 &> /dev/null; then
		echo "Installing $3 from AUR. | $2"
		echo "--------------------------"
		git clone $1 ~/Downloads/AUR_$3
		cd ~/Downloads/AUR_$3
		makepkg -si
	fi
}
installAURPacman() {
    # $1 AUR git repo link
	# $2 Description
	# $3 Package name

	if ! pacman -Q $3 &> /dev/null; then
		echo "Installing $3. | $2"
		git clone $1 ~/Downloads/AUR_$3
		cd ~/Downloads/AUR_$3
		makepkg -si
	fi
}

printf "\n-------------------------"
printf "\nUpdating the system"
printf "\n-------------------------\n"
sudo pacman -Syu

printf "\n-------------------------"
printf "\nInstalling new software packages"
printf "\n-------------------------\n"

if ! type lightdm &> /dev/null; then
	echo "Installing lightdm - Login Manager/Display Manager"
	sudo pacman -S lightdm
	echo "Installing lightdm Greeter - GUI that prompts the user for credentials"
	sudo pacman -S lightdm-slick-greeter
	sudo systemctl enable lightdm
fi
install firefox
install nautilus
install thunar
install catfish "Search tool for Thunar"
installPacman tumbler "Image thumbnail previewer"
install vlc
install mpv
install stow "Dotfiles Setup"
if [ ! -L ~/.zshrc ]; then # -L returns true if the "file" exists and is a symbolic link
	cd ~/Documents/dotfiles/manjaro-dotfiles/
	pwd
	if [ -e ~/.zshrc ]; then # -e (returns true if file exists regardless of type
	    echo "Deleting .zshrc"
	    rm ~/.zshrc
	fi
	echo "Stow creating symlinks"
	stow * -t ~/
fi
install zsh
if [ $SHELL != "/usr/bin/zsh" ]; then
    echo Current shell not zsh, changing:; 
    chsh -s $(which zsh)
fi
if ! type antibody &> /dev/null; then
    printf "Installing zsh plugin manager - Antibody\n\n"
    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin 
    printf "Installing zsh plugins\n\n"
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
fi
install fzf "Search command line history with <CTRL+R>"
install tmux
install nvim
if [ ! -e "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
	echo "Installing Plug - plugin manager for neovim"
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
install ctags

# -------- Programming Languages and Environments ------
if ! type python &> /dev/null; then
	echo "Installing python"
	sudo pacman -S python

	echo "Additional install for coc-nvim python ultisnips"
	python3 -m pip install --user --upgrade pynvim
fi
install node "NodeJS"
install npm "For NodeJS"
install yarn "For NodeJS"
installPacman jre8-openjdk "Java"
install docker
if ! type dotnet &> /dev/null; then
	echo "Installing .NET runtime"
	sudo pacman -S dotnet-runtime
	echo "Installing ASP.NET Core SDK"
	sudo pacman -S dotnet-sdk
	echo "Installing ASP.NET Core runtime"
	sudo pacman -S aspnet-runtime

	echo "dotnet development packages"
	dotnet tool install -g dotnet-aspnet-codegenerator
fi
installPacman java-runtime-common "(containing common files for Java Runtime Environments)"
installPacman java-environment-common "(containing common files for Java Development Kits)" 
install intellij-idea-community-edition " " idea

install pulseaudio
install pavucontrol
install pass
install unzip
install rofi
install flameshot
install dos2unix
install youtube-dl
if ! type transmission-remote &> /dev/null; then
	echo "Installing Transmission Daemon and Cli"
	sudo pacman -S transmission-cli 

	echo "Adding my user to the transmission group so that I can access "
	sudo usermod -a -G transmission $USER

	printf "enabling and starting transmission service\n"
	sudo systemctl enable transmission.service
	sudo systemctl start transmission.service
fi
install flac
install easytag
install shntool "Music"
installPacman cuetools "-"
#install adb "Android debugger"

install libreoffice-still "Libre Office suite" libreoffice 
install hunspell "Spell checker and morphological analyzer library and program"
installPacman hunspell-en_us
installPacman hunspell-en_gb
installPacman hyphen "library for high quality hyphenation and justification"
installPacman hyphen-en
installPacman libmythes "a simple thesaurus"
installPacman mythes-en

install discord
install telegram-desktop
install gimp

installPacman cups "Printer and printing support"
installPacman cups-pdf "Printer and printing support"
install system-config-printer "GTK printer configuration tool and status applet"

install ardour "Music production" ardour6
install calf "Category: music pluggins" calfjackhost
install carla "Category: music pluggins"
install hydrogen "Category: music pluggins"
install musescore "Category: music pluggins"
# ugly interface, one from aur is better
#install zynaddsubfx "Category: music pluggins"

install xorg-xbacklight "tool to control screen brightness" xbacklight
install pwgen "Password Generator"
install mcomix "Manga/Comix reader"
install newsboat "console RSS aggregator"


# ----- AUR -----
installAUR "https://aur.archlinux.org/zyn-fusion.git" "Category: music" zyn-fusion
installAUR "https://aur.archlinux.org/pcloud-drive.git" "Category: cloud" pcloud
installAUR "https://aur.archlinux.org/dropbox.git" "-" dropbox
installAUR "https://aur.archlinux.org/polybar.git" "-" polybar
installAUR "https://aur.archlinux.org/visual-studio-code-bin.git" "Microsoft-branded VSCode release (need it to debug C#)" code
installAURPacman "https://aur.archlinux.org/thunar-dropbox.git" "Dropbox extension for Thunar" thunar-dropbox
installAURPacman "https://aur.archlinux.org/libreoffice-extension-languagetool.git" "Grammar checking for LibreOffice" libreoffice-extension-languagetool
#installAUR "https://aur.archlinux.org/teams.git" "Microsoft Teams" teams
installAURPacman https://aur.archlinux.org/avldrums-lv2-git.git "Extension for Ardour and music making" avldrums-lv2-git 
installAURPacman https://aur.archlinux.org/lingot.git "-" lingot

if ! type  nordvpn &> /dev/null; then
	echo "Installing  NordVPN from AUR"
	git clone https://aur.archlinux.org/nordvpn-bin.git ~/Downloads/NordVPN
	cd ~/Downloads/NordVPN
	makepkg -si

	printf "Set up group rights\n"
	sudo groupadd -r nordvpn
	MYUSERNAME=$(whoami)
	printf "I am - %s \n" $MYUSERNAME 
	sudo gpasswd -a $MYUSERNAME nordvpn

	printf "enabling and starting nordvpn service\n"
	sudo systemctl enable nordvpnd.service
	sudo systemctl start nordvpnd.service
fi



# ----- Installing from source -----
if ! type st &> /dev/null; then
	sudo mkdir /usr/local/src/st
	sudo git clone https://git.suckless.org/st /usr/local/src/st
	cd /usr/local/src/st
	sudo git checkout 0.8.2 # 0.8.4 is out but patch is for 0.8.2

	# my font patch
	sudo wget -L https://raw.githubusercontent.com/yTpo1/dotfiles/master/Scripts/st_font_increase-0.8.2.diff
	sudo patch config.def.h < st_font_increase-0.8.2.diff

	# Gruvbox patch
	sudo wget https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.2.diff
	sudo patch -ruN -d . < st-gruvbox-dark-0.8.2.diff

	echo Installing ST
	sudo make clean install
fi



# ----- Manjaro specific -----
if [ ! -e /etc/modprobe.d/nobeep.conf ]; then
	printf "Disable bios *beep* sounds on backspace\n\n"
	echo nobeep.conf does not exist, creating
	sudo sh -c "echo 'blacklist pcspkr' > /etc/modprobe.d/nobeep.conf"
fi

