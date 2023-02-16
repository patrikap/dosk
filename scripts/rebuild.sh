#!/usr/bin/env bash
### READ .ENV
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

### пересобираем нужный образ тут application
# docker-compose -f docker-compose.yml build --no-cache --force-rm  phpfpm application
# docker-compose -f docker-compose.yml build --no-cache --force-rm application
docker-compose -f docker-compose.yml build --no-cache --force-rm  nginx