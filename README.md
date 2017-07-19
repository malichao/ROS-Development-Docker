# ROS-Development-Docker
A container for ROS developers

This container is inspired by [rosdocked](https://github.com/jbohren/rosdocked). However, I have lots of issues running that container. The main issue is caused by the lack of OpenGL support in the container that I couldn't run any GUI apps apart from Xapps. Because of this , Qt creator and Rviz could not run. These issues are finally solved in this container. One personal preference I added in this container is that I enable the automatic clang format in Qt Creator and set the style to Google style. The last section shows how to 

## What comes in the container
- Ubuntu 14.04
- ROS Indigo full desktop version
- Nvidia Cuda:8.0 (Essential to run Rviz)
- Git
- Qt Creator 4.2.2
- ROS Qt Creator Plugin
- clang formt 3.9
- Python 2.7

## How to build
```
cd docker
./build.sh [Image_name]
```

## How to run
```
./run_docker.sh [Image_name]
```
It mounts the current directory into the *sr/* folder. To run the Qt Creator:
```
qtcreator
```

## How to customize Qt Creator
1. Lauch Qt Creator `qtcreator`
1. Configure Qt Creator as you want
1. Quit and copy `./config/QtProject` to `docker/`
1. Rebuild the image