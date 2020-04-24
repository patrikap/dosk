#!/usr/bin/env bash
### READ .ENV
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}
### CONFIG

# запускаем необходимые контейнеры для локальной разработки
docker-compose -f docker-compose.yml down
docker-compose -f docker-compose.yml stop