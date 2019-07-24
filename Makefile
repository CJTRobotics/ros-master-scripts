# -*- Makefile -*-

ZSH_TEST := $(shell zsh --version 2>/dev/null )
BASH_TEST := $(shell bash --version 2>/dev/null )
all:
	echo 'No rule for make all existing. Please run "sudo make install" to install ros-master-scripts'

install: 
	cp ros-master.sh /usr/local/bin/ros-master
ifdef BASH_TEST
	cp ros-master-completion.bash /etc/bash_completion.d/ros-master
endif
ifdef ZSH_TEST 
	cp ros-master-completion.zsh /usr/local/share/zsh/site-functions/_ros-master
endif
	
remove:
	rm /usr/local/bin/ros-master
ifdef BASH_TEST
	rm /etc/bash_completion.d/ros-master
endif
ifdef ZSH_TEST
	rm /usr/local/share/zsh/site-functions/_ros-master
endif
