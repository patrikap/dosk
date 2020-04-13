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
GID=$(read_var GID .env)
UID=$(read_var UID .env)
CONTAINER_GROUP=containers_group
CONTAINER_USER=containers_user

# copy .env file
cp .env.example .env

sudo groupadd --gid ${GID} --system ${CONTAINER_GROUP}
sudo useradd --uid ${UID} --system --shell /bin/false --gid ${GID} ${CONTAINER_USER}
sudo usermod -aG ${CONTAINER_GROUP} ${USER}

sudo echo "vm.max_map_count=262144" >> /etc/sysctl.d/99-sysctl.conf
sudo echo "vm.swappiness=10" >> /etc/sysctl.d/99-sysctl.conf
sudo echo 262144 > /proc/sys/vm/max_map_count

# переименовать/переместить папку по названию проекта
# удалит папку с гитом
#rm -rf ./git

# возвращаемся в папку со скриптами
cd ./scripts
