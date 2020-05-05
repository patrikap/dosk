#!/bin/bash

APP=dosk

IMAGE_NAME=$APP-redis-store

NGINX_UID=102
NGINX_GID=102
SITE_PATH=/var/www/app
FPM_SOCKET_PATH=/run/php-fpm
CONFIG_PATH=/usr/local/etc/

docker build \
    --build-arg=NGINX_UID=$NGINX_UID \
    --build-arg=NGINX_GID=$NGINX_GID \
    --build-arg=SITE_PATH=$SITE_PATH \
    --build-arg=FPM_SOCKET_PATH=$FPM_SOCKET_PATH \
    --build-arg=CONFIG_PATH=$CONFIG_PATH \
    -t $IMAGE_NAME .
