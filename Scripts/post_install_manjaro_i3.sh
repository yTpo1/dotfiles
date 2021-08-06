#!/usr/bin/sh

# Update system
#sudo pacman -Syu

#sudo pacman -S firefox

echo "dotfiles setup"
sudo pacman -S stow
cd ~/Documents/dotfiles/manjaro-dotfiles/
pwd

if [ -e ~/.zshrc ]; then
    echo "Deleting zshrc"
    rm ~/.zshrc
fi

stow * -t ~/

# Chanage shell to zsh
sudo pacman -S zsh
chsh -s $(which zsh)

# Installing zsh plugin manager - Antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
# Installing zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Disable bios *beep* sounds on backspace
sudo sh -c "echo 'blacklist pcspkr' > /etc/modprobe.d/nobeep.conf"
#sudo echo blacklist pcspkr > /etc/modprobe.d/nobeep.conf

#sudo pacman -S tmux
#sudo pacman -S nvim
#sudo pacman -S pulseaudio
#sudo pacman -S pavucontrol
#sudo pacman -S pass
#sudo pacman -S 



#sudo pacman -S discord
#sudo pacman -S telegram
#sudo pacman -S 
