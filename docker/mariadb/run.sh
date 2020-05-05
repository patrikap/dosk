#!/bin/bash

APP=dosk

IMAGE_NAME=$APP-mariadb
CONTAINER_NAME=$APP-mariadb


docker run -p 3306:3306 --name $CONTAINER_NAME -it --rm \
    $IMAGE_NAME