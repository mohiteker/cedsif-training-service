#!/bin/sh
#created by  shifu@mohitek.net
# A builder of cloudTS should be only one image instance as defined on #{lab2c_image} variable

lab2b_image='training/base24xxmohitek.co.mz-image'
lab2b_release='v2024.01.01'

#build da image e a respectiva release.
DOCKER_BUILDKIT=1 docker build -f Dockerfile \
    --rm  \
    --progress="tty" \
    --tag=${lab2b_image}:${lab2b_release} .
