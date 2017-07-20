#!/usr/bin/env bash

# Check args
if [ "$#" -ne 2 ]; then
  echo "Error! Usage: ./build.sh Dockerfile_Name Image_Name"
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
  --rm -f $1 -t $2 .
