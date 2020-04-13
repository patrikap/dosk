FROM redis:5.0

ARG NGINX_UID
ARG NGINX_GID
ARG CONFIG_PATH

ARG REDIS_SOCKET_PATH

# создаём пользователя
RUN mkdir -p $REDIS_SOCKET_PATH; \
    addgroup --gid $NGINX_GID --system nginx && adduser --uid $NGINX_UID --system --disabled-login --disabled-password --gid $NGINX_GID nginx

COPY redis.conf $CONFIG_PATH/

# CMD /bin/bash 
# ENTRYPOINT /bin/bash
