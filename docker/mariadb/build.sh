#!/bin/bash

APP=dosk

IMAGE_NAME=$APP-mariadb

docker build \
	-e MYSQL_ROOT_PASSWORD=123 \
	-e MYSQL_DATABASE=dosk \
    -t $IMAGE_NAME .
