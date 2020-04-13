#!/bin/bash

APP=cdek

IMAGE_NAME=$APP-nginx
CONTAINER_NAME=$APP-nginx

# Container
CONFIG_PATH=/etc/nginx
DATA_PATH=/var/www/app
SOCKET_PATH=/run/php-fpm

docker run -p 80:80 --name $CONTAINER_NAME -d \
    -v phpFpmSocket:$SOCKET_PATH \
    -v code:$DATA_PATH \
    $IMAGE_NAME