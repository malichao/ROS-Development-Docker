# ROS-Development-Docker
A container for ROS developers

This container is inspired by [rosdocked](https://github.com/jbohren/rosdocked). However, I have lots of issues running that container. The main issue is caused by the lack of OpenGL support in the container that I couldn't run any GUI apps apart from Xapps. Because of this , Qt creator and Rviz could not run. These issues are finally solved in this container. One personal preference I added in this container is that I enable the automatic clang format in Qt Creator and set the style to Google style. The last section shows how to cutomize Qt Creator and upadte the image.

## What comes in the container
- Ubuntu 14.04
- ROS Indigo full desktop version
- Nvidia Cuda:8.0 (Essential to run Rviz)
- Git
- Qt Creator 4.2.2
- ROS Qt Creator Plugin
- clang formt 3.9
- Python 2.7

## Dependencies
- [Nvidia docker](https://github.com/NVIDIA/nvidia-docker)

## How to build
This step is not necessary if you use the docker image on my Docker Hub.

```
cd docker
./build.sh [Image_name]
```

## How to run
```
./run_docker.sh [Image_name]
```
To run the built image on my Docker Hub:
```
./run_docker.sh malichao/ros_indigo_dev
```

It mounts the current directory into the *sr/* folder. To run the Qt Creator:
```
qtcreator
```

To open a new terminal inside the container:
```
./new_docker_terminal.sh [Image_name]
```

## How to customize Qt Creator
1. Lauch Qt Creator `qtcreator`
1. Configure Qt Creator as you want
1. Quit and copy `./config/QtProject` to `docker/`
1. Rebuild the image
