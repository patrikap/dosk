#!/bin/bash

APP=dosk

IMAGE_NAME=$APP-phpcli

SITE_PATH=/var/www/app

docker build \
    --build-arg=SITE_PATH=$SITE_PATH \
    -t $IMAGE_NAME .
