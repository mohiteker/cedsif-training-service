#!/bin/bash
# createdBy shifu@mohitek.net

export OE_CLI_SH="sh"

source $OE_CLI_SH/oe-logger-init.sh  "cedsif" "info" "[Running]"
source $OE_CLI_SH/oe-logger.sh "oe-undeploy" "Undeploying services from traineeID=$1"

# Removing service from worker node. It will persiste all volume changes.
docker service rm $( docker service list --format "{{.Name}}" | grep $1 )

# Check services report
docker service ls
