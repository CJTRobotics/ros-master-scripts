# -*- Makefile -*-

all:
	echo 'No rule for make all existing. Please run "sudo make install" to install ros-master-scripts'

install: 
	cp ros-master.sh /usr/local/bin/ros-master
	cp ros-master-completion.bash /etc/bash_completion.d/ros-master
	      
remove:
	rm /usr/local/bin/ros-master
	rm /etc/bash_completion.d/ros-master
