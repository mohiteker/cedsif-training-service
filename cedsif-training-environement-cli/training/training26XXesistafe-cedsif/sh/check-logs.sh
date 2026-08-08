#!/bin/sh
# created by shifu@mohitek.net

#set java and maven
echo 'JAVA_HOME=$HOME/.sdkman/candidates/java/current MAVEN_HOME=$HOME/.sdkman/candidates/maven/current' >> .bashrc 
echo 'export JAVA_HOME MAVEN_HOME PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH' >> .bashrc

sdk default java  8.0.472-zulu
sdk default maven 3.9.15

#tail -f /var/log/syslog
echo "Running Mohitek Container" > "/tmp/env.log"
ls -l /srv
tail -f /tmp/env.log
