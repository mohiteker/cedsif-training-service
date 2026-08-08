#!/bin/bash
# created by shifu@mohitek.net

#set -x

#Note:>
# base on year all user will start  like
# run ./build "<instance-name>" "<instance-uid>" ex: ./build demo 250010 where [25] is the year and the [10] will be the index
# distributedregistry fixes issues "no image found" over cluster when  images
export OE_CLI_SH="sh"

#only year
yy=2024

uri="localhost"

#load repository
source $OE_CLI_SH/oe-image-repository.sh $1

#["user"]="group1,group2,...,n"
declare -A usermap=(
          ["mohitek"]="${yy}10"
          ["cedsif"]="${yy}60"
)

# user id
uuid=${usermap[$1]}

#export usermap
source $OE_CLI_SH/oe-logger.sh "${oe_f_name}" "using port ${registry_map[$1]} and container_fname=$oe_f_prefix"

#standard parameter
oe_prefix=training
oe_release="v${yy}.01.01"
oe_image_tagged="${oe_prefix}/oe-portal24xxmohitek.co.mz-image:${oe_release}"
oe_image="${uri}:${registry_map[$1]}/${oe_image_tagged}"

#portal section
sh/oe-logger-init.sh

#build da image e a respectiva release.
#--progress="tty|plain|quiet"
DOCKER_BUILDKIT=1 docker build --build-arg oe_prefix=$1 \
    	--build-arg OE_CLI_SH="/usr/local/sbin" --build-arg oe_uuid=${uuid} -f Dockerfile \
    	--rm \
    	--progress "plain" \
    	--tag=${oe_image_tagged} .

#
#docker tag   ${oe_image_tagged} ${oe_image}
#docker tag   "mohitek.net/orchengine-cli:${oe_release}" ${oe_image}
#docker login "https://mohitek.net:${registry_map[$1]}"

#
docker push ${oe_image}

# removing all dangling images to avoid storage leaking
docker rmi $(docker images -f "dangling=true" -q) --force
#docker rmi ${oe_image_tagged}

curl -L "${uri}:${registry_map[$1]}/v2/${oe_image_tagged}/manifests/${oe_release}" | jq .

# call deploy automatically based on code_map| incm=1|mohitek=2|....
#sh/deploy.sh
