#!/bin/bash
# created by shifu@mohitek.net

#set -x
# load users
source sh/oe-environment-usermap.sh ${oe_aux_prefix}

#TODO:>
# load labmap from oe-labmap.conf usin sed.
# includes journalists-environement as a service proovider.(bloggers)| investigations blogger

#TODO:>
# change configuration to json
# load source

# TODO: waiting to deprecation. The configuration must be at external file.
#This is a map of engine by.x=instance, X is the number of remote terminals/instances to be created. For each user we estabilished 2 scalable instances
declare -A map=(
	   ["cedsif"]="edx-platform=[ lms=0 cms=0 ] esistafe=[ securityframework=1 mex=0 mpe=0 ]"
)

#set vars
user_id=${usermap[$1]}
echo "====$user_id"

#splitt by comma 
readarray -d, -t lab_values <<< "${map[$1]}"
#echo [lab_values_is]=${lab_values[@]}
	
	#set main variable to build enviroments by company
	part_head=""
	part_body=""
	part_tail=0
	
#logger
source $OE_CLI_SH/oe-logger.sh "oe-environment-labmap on behalf of $oe_f_name" "selectedLabs={${lab_values[@]}}"
