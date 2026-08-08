#!/bin/bash
# created by shifu@mohitek.net

#source ./oe-logger-init

#declare hosts
hosts=($(hostname -I))
#echo ${hosts[1]}
echo "`date` - ${hosts[0]} - Running [$1.sh]-[$2]"
