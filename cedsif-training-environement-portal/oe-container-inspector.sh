#!/bin/bash
# created by shifu@mohitek.net

#used for debug
#set -x
#docker inspect --format='{{json .}}' ${eachTask} | jq .  >  ../_data/training/mohitek/${service_name}.json

node_id=$(echo
 docker inspect --format '{{json .Config.Labels}}' ${eachTask} | jq . | jq -r '."com.docker.swarm.node.id"')

service_id=$(echo
 docker inspect --format '{{json .Config.Labels}}' ${eachTask} | jq . | jq -r '."com.docker.swarm.service.id"')

service_name=$(echo
 docker inspect --format '{{json .Config.Labels}}' ${eachTask} | jq . | jq -r '."com.docker.swarm.service.name"')

#Fix date cant handle zeno nonemilliseconds
parsed_date=$(date -d "$(docker inspect --format='{{.CreatedAt}}' ${service_name} | sed -E 's/\.[0-9]+//; s/ UTC//')" +%F)
service_created_date=$(date -d "${parsed_date}" +%F)

task_id=$(echo
 docker inspect --format '{{json .Config.Labels}}' ${eachTask} | jq . | jq -r '."com.docker.swarm.task.id"')

#its implicitly generates a dynamic container
task_name=$(echo
 docker inspect --format '{{json .Config.Labels}}' ${eachTask} | jq . | jq -r '."com.docker.swarm.task.name"')

# fix ambiguos expression remove \n on bash prog
json_service_name=$(echo "${service_name}.json" | tr -d '\n')
json_task_name=$(echo "${task_name}.json" | tr -d '\n')
#
path="$(echo ../_data/training/mohitek/)"

#reload files
#rm -f $path/*

# service
#touch  "${path}${json_service_name}"
docker inspect --format='{{json .}}' ${service_id} | jq . > "${path}${json_service_name}"

# task
#touch  "${path}${json_task_name}"
docker inspect --format='{{json .}}' ${task_id} | jq . > "${path}${json_task_name}"

tree "../_data/training/"

#make variable visible over SO
#echo node_id service_id $service_name task_id task_name
#source ./oe-logger.sh "oe-container-inspector" "oe-post-container-details" "Writting dynamically over post file"
source ./oe-post-container-details.sh
