#!/bin/bash

script_name=$0
option_name=$2

function usage () {
    echo "usage : "
    echo "$(basename ${script_name}) { -l | -j | -m | --local | --jetson | --manual }"
    echo ""
}

function local-master () {
    export ROSMASTER=localhost; }

function jetson-master () {
    export ROSMASTER=robot; }

function manual-master () {
    export ROSMASTER=${option_name};}

# check arguments
if [[ $# < 1 || $# > 2 || ( "$1" != "-l" && "$1" != "-j" && "$1" != "-m" && "$1" != "--local" && "$1" != "--jetson" && "$1" != "--manual" ) ]]; then
    usage;
    exit 1;
fi

case $1 in
    "-l" )
        local-master;
        ;;
    "--local" )
        local-master;
        ;;
    "-j" )
        jetson-master;
        ;;
    "--jetson" )
        jetson-master;
        ;;
    "-m" )
        manual-master;
        ;;
    "--manual" )
        manual-master;
esac
ROS_MASTER_URI=http://$ROSMASTER:11311
echo $ROS_MASTER_URI
