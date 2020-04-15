#!/usr/bin/env bash
# переходим науровень выше
cd ../
### READ .ENV
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}
### CONFIG
LOCAL_CONTAINERS=$(read_var LOCAL_CONTAINERS .env)

# запускаем необходимые контейнеры для локальной разработки
docker-compose -f docker-compose.yml up -d $LOCAL_CONTAINERS