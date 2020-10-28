#!/usr/bin/env bash
### READ .ENV
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}
### CONFIG
# LOCAL_CONTAINERS=$(read_var LOCAL_CONTAINERS .env)
chown -R containers_user:containers_group ./data
chmod g+rwx -R ./data