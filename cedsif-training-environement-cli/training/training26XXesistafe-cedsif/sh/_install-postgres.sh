#!/bin/sh
#createdBy shifu@mohitek.net

#
sudo apt-get update

# installing postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# gpg-key
sudo wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null

# install dependencies
sudo apt-get update

DEBIAN_FRONTEND noninteractive
sudo apt-get install postgresql -y postgresql-contrib &&
	apt-get install postgresql-client

sudo systemctl enable postgresql
