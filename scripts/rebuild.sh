#!/usr/bin/env bash
# переходим науровень выше
cd ../
### READ .ENV
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

### пересобираем нужный образ тут application
docker-compose -f docker-compose.yml build --no-cache --force-rm  postgresql

# возвращаемся в папку со скриптами
cd ./scripts