#!/bin/sh
# created by shifu@training.net

# A builder of cloudTS should be only one image instance as defined on #{lab2c_image} variable

# check if the builder is authentic
# docker images --no-trunc --quiet training/portal24xxtraining.ac.mz-image:v2024.08.19

source sh/_head-course.sh
source sh/_trainee-users.sh

#build da image e a respectiva release.
for groupKey in ${!labmap[@]} 
do
    #get an array an branches separated by comma(,)
    readarray -d, -t branches <<< "${labmap[$groupKey]}"
    
    #
    for eachUser in ${branches[@]} 
    do
        lab2b_image="trainee${yy}xx${eachUser}/${course}${yy}xxtraining.dmj.ac.mz-image"

        DOCKER_BUILDKIT=0 docker build -f sample/Dockerfile \
            --rm \
            --build-arg trainee=${eachUser} \
            --tag=${lab2b_image}:${lab2b_release} .
    done
    
done
