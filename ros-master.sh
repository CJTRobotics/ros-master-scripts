#!/usr/bin/env bash

script_name=$0
option_name=$2

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
   # assume Zsh
   file=zshenv;
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
   # assume Bash
   file=bashrc;
else
   echo "Shell currently unsupported.";
   exit 1;
fi

function usage () {
    echo "ROS_MASTER_URI: $ROS_MASTER_URI"
    echo "usage : "
    echo "$(basename ${script_name}) { -l | -j | -m | --local | --jetson | --manual }"
    echo ""
}

function local-master () {
    printf %s\\n '/ROS_MASTER_URI=/s_//.*:_//localhost:_' w q | ed -s ~/.${file}; }

function jetson-master () {
    printf %s\\n '/ROS_MASTER_URI=/s_//.*:_//robot:_' w q | ed -s ~/.${file}; }

function manual-master () {
    printf %s\\n "/ROS_MASTER_URI=/s_//.*:_//$option_name:_" w q | ed -s ~/.${file};}

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

exec $SHELL
