#!/bin/bash
#@author shifu@mohitek.net
#https://www.baeldung.com/linux/bash-substring

#Note:>
# This is  server file_script needed for cleaning the exited container

#get list of exited containers
readarray -d, -t containers <<< "$( docker ps -a --format {{.Names}}{{.Status}} )"

#check exited container
#docker ps -a --format "{{.Status}}{{.Names}}"

#echo "all ${containers[@]}"
for each_container in $containers
do
	#Check if service and if container format ends with word '?'
	if [[ $each_container =~ "service." &&  $each_container == *Exited ]]; then
		#Ends with <filename>
		#sed -n '/Exited$/p' $each_container
		echo "container=[$each_container] is candidate to be removed"

		#preparing the string to be displayed
		each_container="S"$each_container
		docker container rm $( awk -F'S|Exited' '{print $2}' <<< $each_container )

#		#remove if '_' appears
	elif [[ $each_container =~ "_" ]]; then
		 docker container rm $( awk -F'S|_' '{print $2}' <<< $each_container )
	fi
done
