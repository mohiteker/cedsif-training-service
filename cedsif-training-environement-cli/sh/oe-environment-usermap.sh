#!/bin/bash
# created by shifu@mohitek.net

#set -x 

oe_f_name="oe-environment-usermap"

#TODO:>
#	Should be used only inside containers

#source $OE_CLI_SH/oe-logger-init.sh "${oe_f_name}"

# for each company its a new business.
declare -A usermap=(
          ["mohitek"]="demo"
	  ["cedsif"]="demo"
)

# adding map to OS-Environ
export usermap

source $OE_CLI_SH/oe-logger.sh "${oe_f_name}" "$usermap[$1] and container_fname=$oe_f_prefix"
#set suders
sudermap=("startup,demo,trainee")

source $OE_CLI_SH/oe-logger.sh "${oe_f_name}" "suders={$sudermap}"
# over container run
#for groupKey in ${!usermap[@]} 
#do
	#oe_f_name is a container variable used on building time. Should not be considered over orquestration time.
        #get an array an branches separated by comma(,)
        readarray -d, -t branches <<< "${usermap[${oe_f_prefix}]}"

        echo "branchsBygroupKey:[${usermap[${oe_f_prefix}]}]"
	source $OE_CLI_SH/oe-logger.sh "${oe_f_name}" "branchsBygroupKey:[${usermap[$groupKey]}]"

uid=$oe_uuid

        for eachBranch in ${branches[@]}
        do

            let '++uid'

            echo "creating on (${oe_f_prefix}) -> [user:${eachBranch},uid:${uid}]."

            echo "creating rvm group."
            sudo groupadd rvm
            sudo groupadd ${oe_f_prefix}

            # check if map contains suder
            if [[ ${sudermap[@]} =~ ${eachBranch} ]] 
            then
                useradd -rm -d /home/${eachBranch} \
                            -s "/bin/bash"  \
                            -g ${oe_f_prefix} -G rvm \
                            -u ${uid} ${eachBranch}

                echo "setting sudores default password."
                echo "${eachBranch}:master" | chpasswd

                #add user as sudoers
                usermod -aG sudo    ${eachBranch}
                usermod -aG rvm     ${eachBranch}
                usermod -aG ${oe_f_prefix} ${eachBranch}

                echo "setting user [${eachBranch}] as suder."

            else
		#echo "creating non-root user"
                sudo useradd -rm -d /home/${eachBranch} \
                            -s "/bin/bash"  \
                            -g ${oe_f_prefix} -G rvm \
                            -u ${uid} ${eachBranch}

                echo "setting user [${eachBranch}] as non-suder."
                echo "setting default password."
                sudo echo "${eachBranch}:lab2" | chpasswd
            fi
        done
#done
