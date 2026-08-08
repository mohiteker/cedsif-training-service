#!/bin/sh
# by shifu

for groupKey in ${!labmap[@]} 
do
	#get an array an branches separated by comma(,)
	readarray -d, -t branches <<< "${labmap[$groupKey]}"
	
        echo "branchsBygroupKey:[${labmap[$groupKey]}]"

        #replacing values
        #${indexed_array[@]//cool}
        
	for eachBranch in ${branches[@]} 
	do

	    let "++uid"
            
            echo "creating on (${groupKey}) -> [user:${eachBranch},uid:${uid}]."
            
            echo "creating rvm group."
            sudo groupadd rvm
            sudo groupadd ${groupKey}
	   
	    # check if map contains suder
            if [[ ${sudermap[@]} =~ ${eachBranch} ]] 
            then
                useradd -rm -d /home/${eachBranch} \
                            -s "/bin/bash"  \
                            -g ${groupKey} -G rvm \
                            -u ${uid} ${eachBranch}
		
		echo "setting sudores default password."
            	echo "${eachBranch}:appsec" | chpasswd

		#add user as sudoers
		usermod -aG sudo    ${eachBranch}
                usermod -aG rvm     ${eachBranch}
                
		echo "setting user [${eachBranch}] as suder."

            else
                useradd -rm -d /home/${eachBranch} \
                            -s "/bin/bash"  \
                            -g ${groupKey} -G rvm \
                            -u ${uid} ${eachBranch}

		echo "setting user [${eachBranch}] as non-suder."
                #
                #setfacl -m u:${eachBranch}:--- /usr/bin/su
                #setfacl -m u:${eachBranch}:--- /usr/bin/df
                
		#
		usermod -aG sudo ${eachBranch}

                echo "setting default password."
                echo "${eachBranch}:lab2" | chpasswd
            fi
            
            # sudo usermod -aG docker ${eachBranch}
            
            # prepare the development container enviroment
	    #mkdir -p /home/${eachBranch}/.app
             

	done
  	
done
