#!/usr/bin/sh

printf "\nUpdate system\n\n"
sudo pacman -Syu

if ! [ -x $(command -v firefox) ]; then
    sudo pacman -S firefox
fi

printf "dotfiles setup\n\n"
if ! [ -x $(command -v stow) ]; then
    sudo pacman -S stow
fi

cd ~/Documents/dotfiles/manjaro-dotfiles/
pwd
if [ -e ~/.zshrc ]; then
    echo "Deleting zshrc"
    rm ~/.zshrc
fi
stow * -t ~/

printf "Chanage shell to zsh\n\n"
if ! [ -x $(command -v zsh) ]; then
    sudo pacman -S zsh
fi
if [ $SHELL != "/bin/zsh" ]; then
    echo Current shell not zsh, changing:; 
    chsh -s $(which zsh)
fi

printf "Installing zsh plugin manager - Antibody\n\n"
echo "Checking if antibody is installed"
if ! [ -x $(command -v antibody) ]; then
    echo Antibody is not installed, installing.
    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin 
    printf "Installing zsh plugins\n\n"
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
fi

if [ ! -e /etc/modprobe.d/nobeep.conf ]; then
    printf "Disable bios *beep* sounds on backspace\n\n"
    echo nobeep.conf does not exist, creating
    sudo sh -c "echo 'blacklist pcspkr' > /etc/modprobe.d/nobeep.conf"
fi

if ! [ -x $(command -v tmux) ]; then
    sudo pacman -S tmux
fi
if ! [ -x $(command -v nvim) ]; then
    sudo pacman -S nvim
fi
if ! [ -x $(command -v pulseaudio) ]; then
    sudo pacman -S pulseaudio
fi
if ! [ -x $(command -v pavucontrol) ]; then
    sudo pacman -S pavucontrol
fi
if ! [ -x $(command -v pass) ]; then
    sudo pacman -S pass
fi
if ! [ -x $(command -v rofi) ]; then
    sudo pacman -S rofi
fi
if ! [ -x $(command -v flameshot) ]; then
    sudo pacman -S flameshot
fi
#if ! [ -x $(command -v ) ]; then
    #sudo pacman -S 
#fi


#sudo pacman -S discord
#sudo pacman -S telegram-desktop
#sudo pacman -S dropbox
#sudo pacman -S 

#printf "\n \n\n"
