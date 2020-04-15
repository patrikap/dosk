#!/bin/bash

APP=cdek

IMAGE_NAME=$APP-phpfpm

CONFIG_PATH=/usr/local/etc
SITE_PATH=/var/www/app
FPM_SOCKET_PATH=/run/php-fpm
CORES_FOR_COMPILATION=9

docker build \
    --build-arg=NGINX_UID=1002 \
    --build-arg=NGINX_GID=1002 \
    --build-arg=SITE_PATH=$SITE_PATH \
    --build-arg=FPM_SOCKET_PATH=$FPM_SOCKET_PATH \
    --build-arg=CONFIG_PATH=$CONFIG_PATH \
    --build-arg=CORES_FOR_COMPILATION=$CORES_FOR_COMPILATION \
    -t $IMAGE_NAME .
