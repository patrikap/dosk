#!/bin/bash

APP=cdek

IMAGE_NAME=$APP-phpfpm
CONTAINER_NAME=$APP-phpfpm

# Container
SITE_PATH=/var/www/app
FPM_SOCKET_PATH=/run/php-fpm

docker run --name $CONTAINER_NAME -it --rm \
    -v phpFpmSocket:$FPM_SOCKET_PATH \
    -v code:$SITE_PATH \
    $IMAGE_NAME