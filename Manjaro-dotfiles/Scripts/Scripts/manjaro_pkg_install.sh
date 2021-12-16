#!/usr/bin/sh

# ToDo: create function for printing, with input parameter - name of software 

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
if ! type firefox &> /dev/null; then
	echo "Installing Firefox"
	sudo pacman -S firefox
fi

if ! type nautilus &> /dev/null; then
	printf "\nInstalling nautilus\n\n"
	sudo pacman -S nautilus
fi

if ! type thunar &> /dev/null; then
	printf "\nInstalling thunar\n\n"
	sudo pacman -S thunar
fi
if ! type catfish &> /dev/null; then
	printf "\nInstalling catfish - search tool for thunar\n\n"
	sudo pacman -S catfish
fi
if ! pacman -Q tumbler &> /dev/null; then
	printf "\nInstalling tumbler - Image thumbnail previewer\n\n"
	sudo pacman -S tumbler
fi

if ! type vlc &> /dev/null; then
	printf "\nInstalling vlc\n\n"
	sudo pacman -S vlc
fi
if ! type mpv &> /dev/null; then
	printf "\nInstalling mpv\n\n"
	sudo pacman -S mpv
fi

# ----- Dotfiles Setup -----
if ! type stow &> /dev/null; then
    sudo pacman -S stow
fi
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

if ! type zsh &> /dev/null; then
	echo "Installing Zsh"
	sudo pacman -S zsh
fi
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
if ! type fzf &> /dev/null; then
	# usefull for searching history with <CTRL+R>
	echo "Installing FZF"
	sudo pacman -S fzf
fi
if ! type tmux &> /dev/null; then
	echo "Installing tmux"
	sudo pacman -S tmux
fi

if ! type nvim &> /dev/null; then
	echo "Installing neovim"
	sudo pacman -S neovim
fi
if [ ! -e "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
	echo "Installing Plug - plugin manager for neovim"
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
if ! type ctags &> /dev/null; then
	echo "Installing ctags"
	sudo pacman -S ctags
fi
# ======================================================
# -------- Programming Languages and Environments ------
if ! type python &> /dev/null; then
	echo "Installing python"
	sudo pacman -S python

	echo "Additional install for coc-nvim python ultisnips"
	python3 -m pip install --user --upgrade pynvim
fi
if ! type node &> /dev/null; then
	echo "Installing NodeJS"
	sudo pacman -S nodejs
fi
if ! type npm &> /dev/null; then
	echo "Installing NPM for NodeJS"
	sudo pacman -S npm
fi
if ! type yarn &> /dev/null; then
	echo "Installing yarn for NodeJS"
	sudo pacman -S yarn
fi
if ! pacman -Q jre8-openjdk &> /dev/null; then
	echo "Installing jre8-openjdk (Java)"
	# need this for Grammar checking tool -  libreoffice-extension-languagetool
	sudo pacman -S jre8-openjdk
fi
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
if ! type docker &> /dev/null; then
	printf "Installing Docker"
	sudo pacman -S docker
fi
#if ! type code &> /dev/null; then
#	printf "Installing VSCode"
#	sudo pacman -S code
#fi


# ======================================================
# --------------

if ! type pulseaudio &> /dev/null; then
	echo "Installing pulseaudio"
	sudo pacman -S pulseaudio
fi
if ! type pavucontrol &> /dev/null; then
	echo "Installing pavucontrol"
	sudo pacman -S pavucontrol
fi
if ! type pass &> /dev/null; then
	echo "Installing pass"
	sudo pacman -S pass
fi
if ! type unzip &> /dev/null; then
	echo "Installing unzip"
	sudo pacman -S unzip
fi
if ! type rofi &> /dev/null; then
	echo "Installing rofi"
	sudo pacman -S rofi
fi
if ! type flameshot &> /dev/null; then
	echo "Installing Flameshot"
	sudo pacman -S flameshot
fi
if ! type transmission-remote &> /dev/null; then
	echo "Installing Transmission Daemon and Cli"
	sudo pacman -S transmission-cli 

	echo "Adding my user to the transmission group so that I can access "
	sudo usermod -a -G transmission $USER
fi
if ! type dos2unix &> /dev/null; then
	echo "Installin dos2unix (Tool convert files)"
	sudo pacman -S dos2unix
fi
if ! type youtube-dl &> /dev/null; then
	echo "Installing YouTube-DL"
	sudo pacman -S youtube-dl
fi
# ----- Music -----
if ! type flac &> /dev/null; then
	echo "Installing flac"
	sudo pacman -S flac 
fi
if ! type easytag &> /dev/null; then
	echo "Installing easytag "
	sudo pacman -S easytag 
fi
if ! type shntool &> /dev/null; then
	echo "Installing shntool "
	sudo pacman -S shntool
fi
if ! pacman -Q cuetools &> /dev/null; then
	echo "Installing cuetools "
	sudo pacman -S cuetools
fi

#if ! type adb &> /dev/null; then
#	echo "Installing adb"
#	sudo pacman -S adb
#fi

# Office suite
if ! type libreoffice &> /dev/null; then
	echo "Installing LibreOffice"
	sudo pacman -S libreoffice-still
fi
if ! type hunspell &> /dev/null; then
	echo "Installing hunspell"
	# Spell checker and morphological analyzer library and program
	sudo pacman -S hunspell
fi
if ! pacman -Q hunspell-en_us &> /dev/null; then
	echo "Installing hunspell-en_us"
	sudo pacman -S hunspell-en_us 
fi
if ! pacman -Q hunspell-en_gb &> /dev/null; then
	echo "Installing hunspell-en_gb"
	sudo pacman -S hunspell-en_gb 
fi
if ! pacman -Q hyphen &> /dev/null; then
	echo "Installing hyphen"
	# library for high quality hyphenation and justification
	sudo pacman -S hyphen
fi
if ! pacman -Q hyphen-en &> /dev/null; then
	echo "Installing hyphen-en"
	sudo pacman -S hyphen-en
fi
if ! pacman -Q libmythes &> /dev/null; then
	echo "Installing libmythes"
	# a simple thesaurus
	sudo pacman -S libmythes
fi
if ! pacman -Q mythes-en &> /dev/null; then
	echo "Installing mythes-en"
	sudo pacman -S mythes-en
fi

if ! type discord &> /dev/null; then
	echo "Installing Discord"
	sudo pacman -S discord
fi
if ! type discord &> /dev/null; then
	echo "Installing Telegram"
	sudo pacman -S telegram-desktop
fi
if ! type gimp &> /dev/null; then
	echo "Installing gimp"
	sudo pacman -S gimp
fi

# Printing support
if ! pacman -Q cups &> /dev/null; then
	echo "Installing cups - for printer and printing support"
	sudo pacman -S cups
fi
if ! pacman -Q cups-pdf &> /dev/null; then
	echo "Installing cups-pdf"
	sudo pacman -S cups-pdf
fi
if ! type system-config-printer &> /dev/null; then
	echo "Installing GTK printer configuration tool and status applet"
	sudo pacman -S system-config-printer
fi

# Music making
if ! type ardour6 &> /dev/null; then
	echo "Installing Ardour"
	sudo pacman -S ardour
fi
if ! type calfjackhost &> /dev/null; then
	printf "\nInstalling calf - music pluggins"
	printf "\n-------------------------"
	sudo pacman -S calf
fi
if ! type carla &> /dev/null; then
	printf "\nInstalling carla - music pluggins"
	printf "\n-------------------------"
	sudo pacman -S carla
fi
if ! type zynaddsubfx &> /dev/null; then
	printf "\nInstalling zynaddsubfx - music pluggins"
	printf "\n-------------------------"
	sudo pacman -S zynaddsubfx
fi

if ! type xbacklight &> /dev/null; then
	echo "Installing tool to control screen brightness"
	sudo pacman -S xorg-xbacklight
fi

if ! type pwgen &> /dev/null; then
	echo "Installing pwgen - Password Generator"
	sudo pacman -S pwgen
fi

if ! type mcomix &> /dev/null; then
	echo "Installing mcomix - Manga/Comix reader"
	sudo pacman -S mcomix
fi



# ----- AUR -----
if ! type  pcloud &> /dev/null; then
	echo "Installing  pcloud-drive from AUR"
	git clone https://aur.archlinux.org/pcloud-drive.git ~/Downloads/PCloud_AUR
	cd ~/Downloads/PCloud_AUR
	makepkg -si
fi

if ! type dropbox &> /dev/null; then
	echo "Installing Dropbox from AUR"
	git clone https://aur.archlinux.org/dropbox.git ~/Downloads/Dropbox-aur
	cd ~/Downloads/Dropbox-aur
	makepkg -si
fi
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
if ! pacman -Q thunar-dropbox &> /dev/null; then
	echo "Installing Dropbox extension for Thunar from AUR"
	git clone https://aur.archlinux.org/thunar-dropbox.git ~/Downloads/Thunar-Dropbox-aur
	cd ~/Downloads/Thunar-Dropbox-aur
	makepkg -si
fi
if ! type polybar &> /dev/null; then
	echo "Installing polybar from AUR"
	git clone https://aur.archlinux.org/polybar.git ~/Downloads/Polybar-aur
	cd ~/Downloads/Polybar-aur
	makepkg -si
fi
# Grammar checking for LibreOffice
if ! pacman -Q libreoffice-extension-languagetool &> /dev/null; then
	echo "Installing LibreOffice grammar checking from AUR"
	git clone https://aur.archlinux.org/libreoffice-extension-languagetool.git ~/Downloads/Loelt
	cd ~/Downloads/Loelt
	makepkg -si
fi
# Microsoft-branded VSCode release (need it to debug C#)
if ! type code &> /dev/null; then
	echo "Installing VSCode from AUR"
	git clone https://aur.archlinux.org/visual-studio-code-bin.git ~/Downloads/VSCodeMS
	cd ~/Downloads/VSCodeMS
	makepkg -si
fi
# Microsoft-teams
if ! type teams &> /dev/null; then
	echo "Installing Teams from AUR"
	git clone https://aur.archlinux.org/teams.git ~/Downloads/MSTeams
	cd ~/Downloads/MSTeams
	makepkg -si
fi

# Music making
#if ! type avldrums &> /dev/null; then
if ! pacman -Q avldrums-lv2-git &> /dev/null; then
	printf "\nInstalling AVL Drumkits LV2 for Ardour and music making"
	printf "\n-------------------------\n"
	git clone https://aur.archlinux.org/avldrums-lv2-git.git  ~/Downloads/Avldrumkitslv2
	cd ~/Downloads/Avldrumkitslv2
	makepkg -si
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

