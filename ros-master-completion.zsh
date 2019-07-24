#compdef ros-master

_ros-master() {

    local I="-h --help -l --local -j --jetson -m --manual"
    local ret=1
    local -a args

    args+=(
        '(- *)'{-l,--local}'[Set ROS_MASTER_URI to localhost]'
        '(- *)'{-j,--jetson}'[Set ROS_MASTER_URI to robot]'
        '(- *)'{-m+,--manual=}'[Set ROS_MASTER_URI to given hostname]:string:'
    )

    _arguments -w -s -S "$args[@]" && ret=0

    return ret
}

_ros-master
