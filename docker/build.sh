#!/usr/bin/env bash

# Check args
if [ "$#" -ne 1 ]; then
  echo "Error! Usage: ./build.sh IMAGE_NAME"
  exit
fi

group_id=$(cut -d: -f3 < <(getent group sudo))
#sudo docker build --no-cache=true\
sudo docker build \
  --build-arg user=$USER\
  --build-arg uid=$UID\
  --build-arg gid=$group_id\
  --build-arg home=$HOME\
  --build-arg shell=$SHELL\
  -t $1 .
