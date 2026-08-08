#!/bin/bash
# created by shifu@mohitek.net

# https://www.docker.com/blog/how-to-use-your-own-registry-2/
# https://www.geeksforgeeks.org/fix-docker-manifest-unknown-error/


#TODO:>
# change deploy parameter to a group of 1..2 means create 2 groups of mohitek instances with index 1 and 2
# ex: $ ./oe-deploy.sh "cedsif=1..6"
#
export OE_CLI_SH="sh"

export oe_aux_prefix=$( echo "$1" | sed 's/\(.*\)=.*/\1/') #before
#
export oe_domain="${oe_aux_prefix}/oe-portal25xxmohitek.co.mz-image"
#
export oe_code=$( echo "$1" | sed 's/.*=\([0-9]*\)/\1/') #after
#
#/${oe_prefix}/${oe_domain}:${oe_release}"
#
export oe_release="v2024.01.01"

# call variables
source $OE_CLI_SH/oe-image-repository.sh

# setting hosting location over environment
export uri="localhost"

#localhost:50002/incm/mohitek25xxengine-image:v2025.01.01
export oe_image="${uri}:${registry_map[$oe_aux_prefix]}/${oe_domain}:${oe_release}"

source $OE_CLI_SH/oe-logger-init.sh  "$oe_aux_prefix" "info" "[Running]"
source $OE_CLI_SH/oe-logger.sh "oe-deploy on behalf of $oe_aux_prefix" "info" "image=[${oe_image}]"

#call builder recieves the company name | only used outside container to reuse the codebase when docker is building images.
if [[ -z ${oe1_f_name} ]]; then
	source $OE_CLI_SH/oe-environment-builder.sh ${oe_aux_prefix}
fi
