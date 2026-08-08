#!/bin/bash
#created by shifu@mohitek.net

#Note>:
# When scalling start by doing  bash oe-scale-singleton.sh <instance_username>  ex: "./oe-scale-singleton.sh demo"
# each user instance represents the global genereric user by nomenclature

# oe-scale if the main point access that starts all the schema.
#
#set -x
export MAX_REPLICAS=2

oe_f_name="oe-scale-singleton"

export OE_CLI_HOME="/srv/mohitek25XXoengine-platform/mohitek25XXoengine-platform-cli"
export OE_CLI_SH="sh" #/module-Sh/environment-sh

export oe_suffix="service"
export oe_prefix=$1
#
export oe_release="v2025.01.01"
source $OE_CLI_SH/oe-image-repository.sh
#export oe_image="localhost:${registry_map[$oe_prefix]}/training/${oe_aux_prefix}25xxoengine.co.mz-image:${oe_release}"
#
# log and call map list
source $OE_CLI_SH/oe-logger-init.sh "${oe_f_name}"
source $OE_CLI_SH/oe-logger.sh "${oe_f_name}" "image=[${oe_image}]"
#source $OE_CLI_SH/oe-deploy.sh
source $OE_CLI_SH/oe-environment-labmap.sh ${oe_prefix}
#begin
gid=0
	for each_sub in ${lab_values[@]}
	do
		#prepare information
		#if contains expression =[ get into
  		if [[ $each_sub =~ "=[" ]]; then
			#sublabs each_training=[each_module=number_of_tasks
			echo part_head=${each_sub}
		else
			#avoinding to print close brackets
			if [[ ! -z $each_sub && $each_sub != "]" ]]; then
				#
				part_body=$(echo "$each_sub" | sed 's/\(.*\)=.*/\1/') #before
				part_tail=$(echo "$each_sub" | sed 's/.*=\([0-9]*\)/\1/') #after
				#
				echo "	${part_body}"
				echo "		\__ (${part_tail}) environment(s)  "
				echo "             			      "
				#execute abstracted command and
				let '++gid'
        			#
				if [[ ! $part_tail -eq 0 ]]; then
        				for each_user in ${usermap["$1"]} #generate tasks
        				do
						echo "each user $each_user"
        					# set container name | (startup161-incm-service)
						# set scale
					   readarray -d -t services <<< $( docker service ls -q  --filter name=$each_user )
					   for service_id in ${services}
					   do
						#
#						echo "each service  $service_id"
						if [[ ! -z ${service_id} ]]; then
						    docker service scale ${service_id}=${MAX_REPLICAS}
						    sleep 2s #than
						    # run the specificy entrypoint program
 						    service_name=$( echo
 docker inspect --format '{{json .Spec}}' ${service_id} | jq . | jq -r '."Name"')

						    $OE_CLI_SH/oe-scale-entrypoint.sh $service_name
						else
						    $OE_CLI_SH/oe-logger.sh "$oe_f_name" "No Service Found"
						fi
					    done
					done
				fi
			fi
		fi
	done
#end
