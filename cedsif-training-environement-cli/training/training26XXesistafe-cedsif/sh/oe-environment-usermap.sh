#!/bin/bash
# created by shifu@mohitek.net

# sed readKeyVal key=$(sed -n 's/^\([^=]*\)=.*$/\1/p' $each_sub)
#set -x
# File: oe-customer-environemnt-map.sh
oe_f_name="oe-environment-usermap"

#TODO:>
#	Should be used only inside containers

#source $OE_CLI_SH/oe-logger-init.sh "${oe_f_name}"

# for each company its a new business.
#["user"]="group1,group2,...,n"
declare -A usermap=(
          ["mohitek"]="demo"  #10
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
	#oe_f_name is a container variable used on building time
        #get an array an branches separated by comma(,)
        readarray -d, -t branches <<< "${usermap[${oe_f_prefix}]}"

        echo "branchsBygroupKey:[${usermap[${oe_f_prefix}]}]"
	source $OE_CLI_SH/oe-logger.sh "${oe_f_name}" "branchsBygroupKey:[${usermap[$oe_f_prefix]}]"

        #replacing values
        #${indexed_array[@]//cool}

uid=$oe_uuid

        for eachBranch in ${branches[@]}
        do

            let '++uid'

            echo "creating on (${oe_f_prefix}) -> [user:${eachBranch},uid:${uid}]."
            echo "creating rvm group."

            groupadd rvm
            groupadd ${oe_f_prefix}

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

                #
                #usermod -aG sudo ${eachBranch}

                echo "setting default password."
                sudo echo "${eachBranch}:lab2" | chpasswd
            fi
            
            # sudo usermod -aG docker ${eachBranch}

            # prepare the development container enviroment
            # mkdir -p /home/${eachBranch}/.app
        done
#done
