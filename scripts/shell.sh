#!/usr/bin/env bash
### READ .ENV
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}
### GET USER NAME
USER=$(read_var WORKSPACE_USER_NAME .env)

# коннектимся к контейнеру докера
docker-compose -f docker-compose.yml exec --user ${USER} application56 bash