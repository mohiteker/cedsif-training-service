#!/bin/sh
# shifu@mohitek.net

#install zip
apt-get install zip  && \
    apt-get install unzip

#install main sdk
#curl -s "https://get.sdkman.io" | bash
#
export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash

#
source "/usr/local/sdkman/bin/sdkman-init.sh"

# to environment
echo SDKMAN_DIR="/usr/local/sdkman" >> /etc/bash.bashrc
echo source "/usr/local/sdkman/bin/sdkman-init.sh" >> /etc/bash.bashrc
#
sdk version

#
#sdk install java 8.0.422-zulu
#
#sdk install maven 3.6.3

#
# and call load2imageUser. for each creation
# a configuration of source "/.sdkman/bin/sdkman-init.sh" must be set.

#link -sf /home/$USER/.sdkman/candidates/java/current/jre/ jre
