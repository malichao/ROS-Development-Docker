FROM ubuntu:14.04

MAINTAINER Malcolm Ma <malichaooo@gmail.com>

# Arguments
ARG user
ARG uid
ARG gid
ARG home
ARG shell

ENV DEBIAN_FRONTEND=noninteractive

# Basic Utilities
RUN apt-get -y update &&\
	apt-get install -y sudo ssh build-essential git software-properties-common

# Install python development file used by matplot
RUN apt-get update -y && apt-get install -y python2.7-dev python-matplotlib

# Install ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' &&\
	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 &&\
 	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 &&\ 
	apt-get update && apt-get install -y ros-indigo-desktop ros-indigo-uuid-msgs 

RUN rosdep init && rosdep update

# Install extra ros packages, optional
RUN apt-get install -y libalglib-dev ros-indigo-pcl-conversions ros-indigo-pcl-ros \
		ros-indigo-rqt ros-indigo-urg-node

# Clean up the system
RUN rm -rf /var/lib/apt/lists/* && rm -fr /tmp/*

# Make ROS commands available
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN source /opt/ros/indigo/setup.bash

# Install Qt creator 4.2.2 for development
RUN add-apt-repository -y ppa:beineri/opt-qt571-trusty && apt-get -y update &&\
		apt-get install -y qt57creator dbus clang-format-3.9 &&\
		add-apt-repository -y ppa:levi-armstrong/qt-libraries-trusty &&\
		add-apt-repository -y ppa:levi-armstrong/ppa  &&\
		apt-get update && apt-get install -y qt57creator-plugin-ros &&\
		ln -s /opt/qt57/bin/qtcreator /usr/local/bin/qtcreator
