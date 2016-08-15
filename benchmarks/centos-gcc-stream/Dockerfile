FROM centos-gcc
MAINTAINER Nico Mittenzwey <nico.mittenzwey+docker@gmail.com>
# Prepare directory and get source code
RUN 	mkdir /usr/src/stream/ && \
	cd /usr/src/stream/ && \
	curl -OSL https://www.cs.virginia.edu/stream/FTP/Code/stream.c
# Prepare startup file

### TODO : FIND A GOOD WAY TO ADD THIS TO DOCKER IMAGE AND START IT RIGHT AWAY
