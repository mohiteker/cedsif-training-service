#!/bin/sh
# created by shifu@training.net

# loading users
source ext/sample/sh/_head-course.sh
source ext/sample/sh/_trainee-users.sh

#loop
for groupKey in ${!labmap[@]} 
do
	#get an array an branches separated by comma(,)
	readarray -d, -t branches <<< "${labmap[$groupKey]}"
	echo "========================================"
        echo "branchsBygroupKey:$groupKey=[${labmap[$groupKey]}]"
        echo "========================================"
        #replacing values
        #${indexed_array[@]//cool}
     
        #initialize groupId with 1
        let '++gid'
        bid=0
        
        #on the group class  we call it a trainingroom depends on the current course
        lab2b_network_bridge="${course}-${groupKey}-network${yy}-local-bridge"
        lab2b_network_overlay="${course}-${groupKey}-network-${yy}-swarm-overlay"
	
	# connection grupo-network to mysqDB
	#docker network connect ${lab2b_network} mysqldb-laba2e2.net
	
        #
        for eachUser in ${branches[@]} 
	do
                #comparing groupKey againts the pattern and set the  correct portValue for the trainee.
                case $groupKey in
                    "grupo-i")
                       #set gid and keep the bid trainee position.
                       gid=1
                       ;;
                    "grupo-ii")
                       gid=2
                       ;;
                    "grupo-iii")
                       gid=3
                       ;;
                    "grupo-iv")
                       gid=4
                       ;;
                    "grupo-v")
                       gid=5
                       ;;
                    "grupo-x")
                       gid=6
                       ;;
                       *)
                       echo -n "No groupKey found."
                       ;;
                    esac

                #initialize branch id with 1
		let '++bid'

                #message
                echo -n "found key=[$groupKey] and setting gid to $gid "

                #ports 2|3|4|8 defaults
                
               lab2b_port_ssh="${gid}${bid}${bid}1"
	     lab2b_port_https="${gid}${bid}${bid}2"
                lab2b_port_40="${gid}${bid}${bid}3"
                lab2b_port_80="${gid}${bid}${bid}4"
		
		nid=${gid}${bid}
	    	lab2b_container_name="${eachUser}${nid}-${groupKey}-${course}"     
		#removing early container
		#docker rm -f ${lab2b_container_name}

		#removing service
                #echo "Removing service: [${lab2b_container_name}-service]"
		#docker service rm ${lab2b_container_name}-service
                
                echo ""

		#creating and deploying service over cloud nodes
		#https://docs.docker.com/engine/storage/drivers/
		#--stop-grace-period {duration}   Time to wait before force killing a container (ns|us|ms|s|m|h) (default 10s)

		docker service rm "${lab2b_container_name}-service"
		 
                #wait a while
                sleep 1s
                
	#https://docs.docker.com/engine/swarm/join-nodes/
	#https://docs.docker.com/engine/swarm/networking/	
	done
  	
	# connection grupo-network to mysqDB
        # docker network connect ${lab2b_network} mysqldb-shared-service

done
