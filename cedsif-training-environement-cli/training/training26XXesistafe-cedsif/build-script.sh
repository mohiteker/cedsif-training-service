#!/bin/bash
# Ref..:https://noir-lang.org/docs/explainers/explainer-writing-noir#the-ethereum-virtual-machine-evm
#created by  shifu@dmj-it.net
# A builder of cloudTS should be only one image instance as defined on #{lab2c_image} variable

#docker-compose up --build #--progress tty #--no-cache
docker-compose build --no-cache
