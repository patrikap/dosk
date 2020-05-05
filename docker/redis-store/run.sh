#!/bin/bash

APP=dosk

IMAGE_NAME=$APP-redis-store
CONTAINER_NAME=$APP-redis-store

REDIS_SOCKET_PATH=/run/redis

docker run -p 6379:6379 --name $CONTAINER_NAME -it --rm \
    $IMAGE_NAME