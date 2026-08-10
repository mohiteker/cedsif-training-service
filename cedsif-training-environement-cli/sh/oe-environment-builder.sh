#!/bin/bash
#created by shifu@mohitek.net

#set -x
source $OE_CLI_SH/oe-logger.sh "oe-environment-builder" "image=[$oe_image]"
oe_suffix="service"
oe_prefix=${oe_aux_prefix}

# demo11 1 1 =demo[XX] [1-99] 	  [1-10]      [1-X]
# demo11 2 1 =demo[kid] [user_id] [module_id] [group_id]

#set grupoID

# module id is incremetal variable
mid=0 

# fixed variable
gid=0

# is a restartable variable, to control the position of a user in each module
uid=0

#call map where $1 is the specified clientId
source $OE_CLI_SH/oe-environment-labmap.sh ${oe_prefix}
#
	for each_sub in ${lab_values[@]}
	do
		# restart goup for each training module
		let '++uid'
		#prepare information
		#if contains expression =[ get into
  		if [[ $each_sub =~ "=[" ]]; then
			#sublabs each_training=[each_module=number_of_tasks
			#part_head=${each_sub}
			echo $each_sub
			#extract keyHead
			part_head=$( echo "$each_sub" | sed 's/\(.*\)=.*/\1/' )

		else
			#avoinding to print close brackets
			if [[ ! -z $each_sub && $each_sub != "]" ]]; then

				let '++mid'

				#
				part_body=$(echo "$each_sub" | sed 's/\(.*\)=.*/\1/') #before
				part_tail=$(echo "$each_sub" | sed 's/.*=\([0-9]*\)/\1/') #after

				#check the group number
				#set gid and keep the bid trainee position.
				case $part_body in
                    			'securityframework')
                       				gid=1
                       				;;
                    			'mex')
                       				gid=2
                       				;;
                    			'mpe')
                       				gid=3
						;;
                       			*)
          #             			echo -n "No groupKey found."
                       				;;
             			esac
				#
				echo "	${part_body}"
				echo "		\__ ${part_tail} instance(s)"
				#
				if [[ ! $part_tail -eq 0 ]]; then
        				for uid in $(eval echo "{1..$part_tail}") #generate tasks
        				do
						#oe_hostname="${part_body}25xx${oe_prefix}-node${oe_code}${each_service}"
						#oe_hostname="${oe_prefix}25xx${part_body}-node${oe_code}${each_service}"
						#
						#execute creation operation

						#TODO:> put the switch case here to define thee number of the groups and positions
						oe_port_ssh=${oe_code}${uid}${gid}${mid}1
						 oe_port_30=${oe_code}${uid}${gid}${mid}2
						 oe_port_32=${oe_code}${uid}${gid}${mid}3
						 oe_port_40=${oe_code}${uid}${gid}${mid}4
						 oe_port_42=${oe_code}${uid}${gid}${mid}5
						 oe_port_80=${oe_code}${uid}${gid}${mid}6
						 oe_port_90=${oe_code}${uid}${gid}${mid}7
						 oe_port_91=${oe_code}${uid}${gid}${mid}8
						 oe_port_https=${oe_code}${uid}${gid}${mid}9
						#
						oe_container_name="${user_id}${oe_port_ssh}-${oe_prefix}-${part_head}-${part_body}"
						oe_hostname="${oe_prefix}24xx${part_head}-${part_body}-node${oe_port_ssh}"
						oe_service_name="${oe_container_name}-${oe_suffix}"
						# TODO:>
						# Get all images and filter by oe_prefix and
						# 	docker image list --format "{{pad .Repository 2 4}}"
						#	docker image list --format "{{.Repository}}:{{.Tag}}"
						# Get the exported oe_image variable and change it with the value of
                                                # the current service image.

						# BugFix:
						# This script introudced a bug on release vXX.XX.XX where grepping over | grep "/${oe_prefix}/training/${part_head}'.
						#set -x
						oe_image=$( docker image list --format "{{.Repository}}:{{.Tag}}" | grep "/${oe_prefix}/training/${part_head}" )
						#source $OE_CLI_SH/oe-logger.sh "oe-environment-builder" "WARNING: BugFix: This feature must be changed to enable training/production images"

						#echo "exported oe_image=->" $oe_image
						echo "yes:$oe_image"
                                                #
						if [[ $oe_image =~ 'training' ]]; then
                                                	oe_container_label="mz.${oe_prefix}.oe.trainee.name=${oe_port_ssh}"
                                                	#echo "Lable is: $oe_container_label"
							source $OE_CLI_SH/oe-environment-creator.sh #${oe_prefix} ${oe_image}
						else
							source $OE_CLI_SH/oe-logger.sh "oe-environment-builder" "WARNING: No Production images exists Yet. We are Planning to release."
						fi
					done
				fi
			fi
		fi
		# restart uid to 0 to gain the same id at the another module
		uid=0
	done
#end
