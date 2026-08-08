#!/bin/bash
# created by shifu@mohitek.net

#set network
oe_swarm_network="${oe_prefix}-${part_body}-network"

#TODO. control this flux later to run only if not created yet.
#define an cluster network to related containers
docker network create --driver overlay --attachable ${oe_swarm_network}
#update and add service to swam network
docker service update --network-add ${oe_swarm_network} ${oe_service_name}

#logger
source $OE_CLI_SH/oe-logger.sh "oe-environment-network" "adding the cluster-network=[${oe_swarm_network}] to service=[${oe_service_name}]"

#wait a while
sleep 1s
