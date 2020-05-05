#!/bin/bash

APP=dosk

IMAGE_NAME=$APP-redis-store

NGINX_UID=102
NGINX_GID=102
CONFIG_PATH=/usr/local/etc/redis/
REDIS_SOCKET_PATH=/run/redis


docker build \
    --build-arg=NGINX_UID=$NGINX_UID \
    --build-arg=NGINX_GID=$NGINX_GID \
    --build-arg=CONFIG_PATH=$CONFIG_PATH \
    -t $IMAGE_NAME .
