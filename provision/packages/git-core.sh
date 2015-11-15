#!/bin/sh

# generate ssh keys replace it with your email address
if [ -f /home/vagrant/.ssh/config ]; then
	echo "skip generate ssh key"
else
	echo "generate ssh key that have to be uploaded to github"
	ssh-keygen -t rsa -C "pussinboots666@googlemail.com"
	# solve the ssh github problem see https://help.github.com/articles/using-ssh-over-the-https-port#enabling-ssh-connections-over-https
	echo "Host github.com
	  Hostname ssh.github.com
	  Port 443" > /home/vagrant/.ssh/config
	chown vagrant:vagrant /home/vagrant/.ssh/config
	chmod 600 .ssh/*
fi

echo "git installation"

# install git
apt-get install git-core
apt-get -f install
