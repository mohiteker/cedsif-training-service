#!/bin/bash
# created by shifu@mohitek.net

#Note:>
# This algoritm is based on docker swarm container schedule performance. it controls the task generator
# and take those advantage to perform other operations. Its awesome.

#logger
source $OE_CLI_SH/oe-logger.sh "$OE_CLI_SH/oe-scale-entrypoint on behalf of $oe_f_name" "image=[${oe_image}:${oe_release}]"

 # load service instances/tasks
readarray -d -t tasks <<< $( docker container ls -q  --filter name=$1 )
                # put Ids into containerMap
		source $OE_CLI_SH/oe-logger.sh "$OE_CLI_SH/oe-scale-entrypoint"
                i=0
                for each_task in $tasks
                do
                  let '++i'
                        # Note:/> For execution use docker ... -di for detached mode or -i for interactive mode (debug)
                  case $i in
                    "1") #01_HA-proxy-controller(1-apache|2-ngnix)
                       #docker container exec -ti $each_task bash /usr/sbin/proxyHa-install "1"
                       #docker container exec -di $each_task bash /usr/local/sbin/start-portal-api.sh
		       echo "C1"
                       ;;
                    "2")
                       docker container exec -ti $each_task bash /usr/local/sbin/start-portal-gui.sh
                       ;;
                       *)
                       source $OE_CLI_SH/oe-logger.sh "oe-scale-entrypoint" "No service option found."
                       ;;
                    esac
                    #
                    source $OE_CLI_SH/oe-logger.sh "oe-scale-entrypoint" "$i=>node[=${nid}-taskname[=${each_task}-taskid[=$i"
                done
