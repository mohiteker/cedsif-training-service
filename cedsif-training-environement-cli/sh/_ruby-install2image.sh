#!/bin/bash
#adpated by shifu@mohitek.net

ls -shl /usr/share/rvm

rvm info

source /usr/share/rvm/scripts/rvm

echo source /usr/share/rvm/scripts/rvm >> /etc/bash.bashrc

# install ruby
rvm install ruby 3.2.3
#sleep 1s

# info when installed
rvm info

# install bundle to only one instance. Its a good gain of configuration. Because thereis no more consumption memory use for each trainee. BugFixed on container load.
gem install bundler -v 2.4.22
gem install jekyll-environment-variables
#sleep 1s

# match and install all gems dependency anounced on Gemfile.lock
#cd /srv/trainee24XXshifu-portal/

#https://rubygems.org/specs.4.8.gz
#bundle install

#cd /tmp/ruby-3.2.3
#    ./configure.sh --prefix="/usr/share/ruby"
