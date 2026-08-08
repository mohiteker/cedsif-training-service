#create by shifu@mohitek.net
#This image is to intend to create a docker os system deployed as a service (OSaaS) over a node cluster. using ubuntu image
#Docker allows only one app per isolated process as a deamon as main.

# This is the base image for all training path
FROM ubuntu:22.04 AS base-builder

RUN apt-get update
RUN apt-get install zip -y && \
	 apt-get install unzip -y
	 
RUN apt-get install acl -y
RUN apt-get install ca-certificates sudo -y \
    curl  \
    gnupg \
    apt-utils

RUN apt-get install tree -y && \
    apt-get install git -y

RUN apt-get install nano -y && \
    apt-get install htop -y

RUN apt-get install net-tools -y && \
    apt-get install iputils-ping -y

RUN apt-get install apt-utils

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Johannesburg

RUN apt-get install tzdata -y

RUN apt-get install -y debconf-utils \
 && echo "tzdata tzdata/Areas select Africa" | debconf-set-selections \
 && echo "tzdata tzdata/Zones/Africa select Johannesburg" | debconf-set-selections \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get --fix-broken install
RUN apt-get update

RUN apt-get install -y software-properties-common
RUN apt-get install openssh-server -y
RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get install alien -y
