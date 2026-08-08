#!/bin/bash
# created by shifu@mohitek.net

# Note:>
# This file will be used in generally to rename the settings for each environment. Its extremilly important
# and confident. Please use it safetly and add each line for changes you want to do over _config.yml file
# and any document inside the tree project
# id -u -n
# $1 is a file or path

# Sections
#source /usr/sbin/ext/sh/_head-course.sh
OE_CLI_SH=/usr/local/sbin

#init
	$OE_CLI_SH/oe-logger-init.sh
	$OE_CLI_SH/oe-logger.sh "oe-trainee-config" "Building [$USER] enviroment inside container"

# compose parameters
uname=$USER
gname=$( id --name -g )

#https://linuxconfig.org/how-to-configure-ssh-client-step-by-step-tutorial
#configuration prioritizes public key authentication and disables password authentication.
#https://ftp.perforce.com/perforce/tools/benchmarks/browse/doc/identity.html
# add vars to environment
#export sshPort=$( echo $(jq '.CreatedAt' "${service_json}" ) )
#export sshKey="${gname}.pub"

# filter if user is non-root
cd ~

 if [[ ! -z $uname ]]; then
	ln -sf /srv/mohitek25XXsample-platform-portal trainee25XX${USER}-portal

  # change user permissions
  #git clone -b mybranch --single-branch git://sub.domain.com/repo.git
  cd ~/trainee25XX${USER}-portal/
  	sudo chown -Rh $uname:$gname *

  #remove unnessary link TODO: check why its allways appearing
  #rm mohitek25XXoengine-platform-portal
  #rm portal

  #change _config.yml properties
  #sed -i -e "s/{0}/$USER/g" _config.yml

 #pom.xml
  sed -i -e "s/mz.ac.dmj.trainee24xxdemo.portal.lab/mz.mohitekframework.trainee${year}xx${USER}.${course}.lab/g" pom.xml
  sed -i -e "s/training24XXportal-grupo-x-shifu-lab/training${year}XX${course}-${group}-${USER}-lab/g" pom.xml
  sed -i -e "s/trainee24XXshifu-portal/trainee${year}XX${course}-portal/g" pom.xml
 
 #initialize demo portal
 #oe-logger-init.sh "portal-install" "Running  blundler inside container"
 #       bundle install
	
 fi

#check modifications
#more _config.yml
#TODO:
# Fix this issue. always appears when multiple instance of sess
rm -rf mohitek25XXoengine-platform-portal
