#!/bin/sh
# by shifu

# rvm installation
# install rvm
sudo apt-get install rvm -y

LD_LIBRARY_PATH="/lib/x86_64-linux-gnu"
echo export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:"/lib/x86_64-linux-gnu":"/lib/x86_64-linux-gnu/openssl":"/usr/local/pkcs11/lib":"/usr/local/opencryptoki/lib"

# simple module provider
sudo apt install p11-kit

# add rvm at runtime
source /usr/share/rvm/scripts/rvm

# add root to group
# rvmsudo rvm get master
sudo groupadd rvm

# add rvm to so_configuration
echo source /usr/share/rvm/scripts/rvm >> /etc/bash.bashrc

# check info
rvm info

# ruby and gem
ls -shl /usr/share/

rvm info

source /usr/share/rvm/scripts/rvm

echo source /usr/share/rvm/scripts/rvm >> /etc/bash.bashrc

# install ruby
rvm install ruby 3.2.3
#TODO
#cd /tmp/ruby-3.2.3
        #  ./configure.sh --prefix="/usr/share/ruby"

# info when installed
rvm info

# install bundle to only one instance. Its a good gain of configuration. Because thereis no more consumetion memoryuse for each trainee.
gem install bundler -v 2.4.22
#sleep 1s

# match and install all gems dependency anounced on Gemfile.lock
##cd /srv/training25XXappsecurity-grupo-x-trainee-lab/
	#https://rubygems.org/specs.4.8.gz
##	bundle install
