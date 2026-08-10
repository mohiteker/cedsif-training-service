#!/bin/bash
#created by shifu@mohitek.net
# on behalof mohitek-oengine=mohitek Orchestrator Engine
#  --publish <PUBLISHED-PORT>:<SERVICE-PORT> flag. 
#  docker service update --args "ping docker.com" helloworld
#echo ${oe_container_name}
#echo ${oe_container_label}
#echo ${oe_hostname} 
#
#docker node update --availability drain  <NODE-ID> 
#docker node update --availability active <NODE-ID> 
source $OE_CLI_SH/oe-logger.sh "oe-environment-creator" "image=[$oe_image]"
#

#docker image list --format '{{pad .Repository 5 10}}'

docker service rm ${oe_service_name}
docker service create \
     --name      "${oe_service_name}" \
     --container-label "${oe_container_label}" \
     --publish   "${oe_port_ssh}:22" \
     --publish   "${oe_port_30}:3000" \
     --publish   "${oe_port_32}:3002" \
     --publish   "${oe_port_40}:4000" \
     --publish   "${oe_port_42}:4200" \
     --publish   "${oe_port_80}:8080" \
     --publish   "${oe_port_90}:9000" \
     --publish   "${oe_port_91}:9001" \
     --publish   "${oe_port_https}:443" \
     --limit-cpu "5.5" \
     --mount type=volume,source="${oe_container_name}-volume",target="/srv/" \
     --hostname  "${oe_hostname}" \
     --replicas-max-per-node "2" \
     --placement-pref "spread=node.labels.trainee.name" \
     --update-delay "2s" \
     --rollback-failure-action "continue" \
     --limit-memory "4098MB" "${oe_image}" \
#     --constraint 'node.labels.trainee.name==demo${oe_port_ssh}' \
     --constraint 'node.role==worker' \
#     --constraint 'node.labels.storage==true' \
#     --constraint 'node.hostname==node01' \
source $OE_CLI_SH/oe-logger.sh "oe-environment-creator" "${oe_service_name} successfully created."
docker service ls --filter name=${oe_service_name}

# create network and connect containers from same group
source $OE_CLI_SH/oe-environment-network.sh ${oe_service_name}

# set scale
docker service scale ${oe_service_name}=0
	#whait a while
	sleep 1s
