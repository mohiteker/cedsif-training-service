#!/bin/bash
# created by shifu@mohitek.net

#Note:>
# This file is intend to be run inside container

# start ssh service
/usr/sbin/sshd

source /usr/share/rvm/scripts/rvm
##ls -l /usr/share/rvm/scripts/rvm
#cd /usr/share/rvm/scripts/rvm

##rvm info

# add scripts to enviroment
echo "source /usr/share/rvm/scripts/rvm" >> /etc/bash.bashrc
echo "source /usr/local/sbin/oe-trainee-config.sh" >> /etc/bash.bashrc

# add service.1/2 to environment to facilitate variables check
echo 'export service_json=$( find /srv/mohitek25XXsample-platform-portal/_data/training/mohitek/ -type f -name '*service.json' )' >> /etc/bash.bashrc
echo 'export service_1_json=$( find /srv/mohitek25XXsample-platform-portal/_data/training/mohitek/ -type f -name '*service.1*' )' >> /etc/bash.bashrc
echo 'export service_2_json=$( find /srv/mohitek25XXsample-platform-portal/_data/training/mohitek/ -type f -name '*service.2*' )' >> /etc/bash.bashrc

# Force loading environment configuration
#source /etc/bash.bashrc

# match and install all gems dependency anounced on Gemfile.lock inside container
cd /srv/
  tar xfv mohitek25XXsample-platform-portal.tar.gz
    cd /srv/mohitek25XXsample-platform-portal
	oe-logger-init.sh "portal-install" "Running  blundler inside container"
	bundle install
	#bash _sh/start-portal.sh "https"

# use the standard user
su demo

# keep environment standed on my service
tail -f $( find /srv/mohitek25XXsample-platform-portal/_data/training/mohitek/ -type f -name '*service.json' )
