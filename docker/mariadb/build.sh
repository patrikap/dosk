#!/bin/bash

APP=cdek

IMAGE_NAME=$APP-mariadb

docker build \
	-e MYSQL_ROOT_PASSWORD=123 \
	-e MYSQL_DATABASE=cdek \
    -t $IMAGE_NAME .
