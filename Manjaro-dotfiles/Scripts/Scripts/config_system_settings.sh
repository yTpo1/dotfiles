#!/bin/bash

# To disable automatic startup of services use:
# sudo systemctl disable docker.service

# Created symlink /etc/systemd/system/multi-user.target.wants/docker
#.service → /usr/lib/systemd/system/docker.service.
#Created symlink /etc/systemd/system/multi-user.target.wants/contai
#nerd.service → /usr/lib/systemd/system/containerd.service.

# ------------------------------------------------------
# Docker Post-installation steps for Linux
# ------------------------------------------------------

# Create the docker group.
if ! grep -q -E "^${USER}:" /etc/group ; then
	echo creating group docker
	sudo groupadd docker
fi
if ! getent group docker | grep -q "\b${USER}\b" ; then
	echo Adding $USER to the docker group.
	sudo usermod -aG docker $USER
fi

# Start docker on startup
if [ ! -L /etc/systemd/system/multi-user.target.wants/docker.service ]; then
	echo docker.service doesnt exist
	sudo systemctl enable docker.service
fi
if [ ! -L /etc/systemd/system/multi-user.target.wants/containerd.service ]; then
	echo containerd.service doesnt exist
	sudo systemctl enable containerd.service
fi


