# -*- Makefile -*-

all:
	echo 'No rule for make all existing. Please run "sudo make install" to install ros-master-scripts'

install: 
	cp ros-master.sh /usr/local/bin/ros-master
	mkdir /usr/local/share/ros-master
	cp ros-master-exec.sh /usr/local/share/ros-master/ros-master-exec.sh
	cp ros-master-completion.bash /etc/bash_completion.d/ros-master
	echo 'This has to be in your .bashrc :'  \n "ROSMASTER=localhost" \n 'ROS_MASTER_URI=http://$ROSMASTER:11311'
	      
remove:
	rm /usr/local/bin/ros-master
	rm -rf /usr/local/share/ros-master
	rm /etc/bash_completion.d/ros-master
