#!/bin/bash

set -e

#-------------------------------------------------------------------------------
usage() {
 echo
 echo "Usage: build.sh [-d] [-c] [-l] [-h] [-e]"
 echo
 echo "-d: install build dependencies (bower, grunt)"
 echo "-c: clean build"
 echo "-l: preserve main.js"
 echo "-e: apply enterprise edition patchs"
 echo "-h: prints this help"
}

eval set -- "$TEMP_OPT"

while true ; do
    case "$1" in
        -d) DEPENDENCIES="yes"   ; shift ;;
        -c) CLEAN="yes"   ; shift ;;
        -l) DO_LINK="yes"   ; shift ;;
        -e) ENTERPRISE="yes"; shift;;
        -h) usage; exit 0;;
        --) shift ; break ;;
        *)  usage; exit 1 ;;
    esac
done