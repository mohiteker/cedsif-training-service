#!/bin/sh
# created by shifu@mohitek.net

#OE_CLI_SH="sh"
OE_CLI_HOME="/srv/cedsif-training-environment"
OE_CLI_SSL=${OE_CLI_HOME}/"ssl"

oe_f_name="image-repository"
# This list maps all repositories ports
#source $OE_CLI_SH/oe-logger-init.sh

declare -A registry_map=(
	   ["cedsif"]="50004"
)

export registry_map
source $OE_CLI_SH/oe-logger.sh "${oe_f_name}" "the Registry port of $registry_map[$1] is ${registry_map[$1]}"

# check if  map contains parameter
docker run -d -p "${registry_map[$1]}:5000" --name $1-registry registry:2

# push image to central repository
#docker push localhost:${registry_map[$1]}/distributedregistry24xxmohitek.co.mz-image:v2024.01.01
