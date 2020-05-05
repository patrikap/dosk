#!/bin/bash

APP=dosk

IMAGE_NAME=$APP-phpcli
CONTAINER_NAME=$APP-phpcli

SITE_PATH=/var/www/app

docker run --name $CONTAINER_NAME -it --rm  \
    -v code:$SITE_PATH \
    $IMAGE_NAME