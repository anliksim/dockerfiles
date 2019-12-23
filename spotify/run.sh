#!/bin/bash

CONTAINER_NAME=spotify

if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then

  echo "Starting existing $CONTAINER_NAME container"

  docker start "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)"

elif [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then

  echo "Starting new $CONTAINER_NAME container"

  docker run -it \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=unix${DISPLAY}" \
    -v /dev/snd:/dev/snd --privileged \
    --name $CONTAINER_NAME \
    ff07f18d921b

else
  echo "A container with the name $CONTAINER_NAME is already running"
fi
