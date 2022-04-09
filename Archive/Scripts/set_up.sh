#!/bin/sh

# Remove files that will interfere with stow
rm ~/.bash_profile ~/.bashrc

# create simlinks for the configuration files
(cd ../dotfiles/; stow * -t ~/)

