#!/usr/bin/env bash
### READ .ENV
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}
### CONFIG
LOCAL_CONTAINERS=$(read_var LOCAL_CONTAINERS .env)
# export -n DOCKERHOST
# export -n DOCKER_HOST
DOCKER_HOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
sed -i "/^D_H.*/ d" ./.env
echo "D_H="$DOCKER_HOST >> ./.env
#    extra_hosts:
#      - "localhost:${DOCKER_HOST}"
# запускаем необходимые контейнеры для локальной разработки
docker-compose -f docker-compose.yml up -d $LOCAL_CONTAINERS