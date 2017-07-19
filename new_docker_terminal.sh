#!/usr/bin/env bash

# Check args
if [ "$#" -ne 1 ]; then
  echo "Error! Usage should be: ./new_docker_terminal.sh container_name"
  exit
fi

docker_id=$(sudo docker ps | grep $1 | cut -c 1-12)

sudo docker exec -it $docker_id /bin/bash
