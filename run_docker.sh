#!/usr/bin/env bash

# Check args
if [ "$#" -ne 1 ]; then
  echo "Error! Usage should be: ./run.sh IMAGE_NAME"
  exit
fi

xhost +

sudo nvidia-docker run\
  --net=host\
  -e SHELL\
  -e DISPLAY=unix:0.0\
  -e NO_AT_BRIDGE=1 \
  -e QT_X11_NO_MITSHM=1\
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged\
  -v /tmp/.docker.xauth:/tmp/.docker.xauth \
  -e XAUTHORITY=/tmp/.docker.xauth \
  -v `pwd`:/src\
  -it --rm $1 /bin/bash

  #-v `pwd`:/src
  #-v "$HOME:$HOME:rw"\
