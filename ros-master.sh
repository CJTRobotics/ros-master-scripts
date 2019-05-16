#!/bin/bash

script_name=$0
option_name=$2

function usage () {
    echo "usage : "
    echo "$(basename ${script_name}) { -l | -j | -m | --local | --jetson | --manual }"
    echo ""
}

function local-master () {
    printf %s\\n '/ROS_MASTER_URI=/s_//.*:_//localhost:_' w q | ed -s ~/.bashrc; }

function jetson-master () {
    printf %s\\n '/ROS_MASTER_URI=/s_//.*:_//robot:_' w q | ed -s ~/.bashrc; }

function manual-master () {
    printf %s\\n "/ROS_MASTER_URI=/s_//.*:_//$option_name:_" w q | ed -s ~/.bashrc;}

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

exec $BASH
