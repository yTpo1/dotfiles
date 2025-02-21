#!/usr/bin/bash


function service_enable() {
	if sudo systemctl is-active --quiet $1; then
		echo $1 Inside of the if statement
	else
		echo outside
		sudo systemctl status $1
	fi
}


service_enable httpd.service
service_enable nginx.service

# sudo systemctl enable mariadb.service
# sudo systemctl start mariadb.service
