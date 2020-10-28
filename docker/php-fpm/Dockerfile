FROM php:7.4-fpm

ARG NGINX_UID
ARG NGINX_GID
ARG CONFIG_PATH

ARG SITE_PATH
ARG FPM_SOCKET_PATH
ARG REDIS_SOCKET_PATH

# создаём пользователя
RUN rm $CONFIG_PATH/php-fpm.d/*; mkdir -p $FPM_SOCKET_PATH $REDIS_SOCKET_PATH $SITE_PATH; \
    addgroup --gid $NGINX_GID --system nginx && adduser --uid $NGINX_UID --system --disabled-login --disabled-password --gid $NGINX_GID nginx

RUN apt-get update -y && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev \
    libonig-dev \
    libzip-dev \
    zip \
    libpq5 \
    libpq-dev \
    librabbitmq-dev \
    libssh-dev

RUN apt-get install -y postgresql-client

# конфигурируем исходники. набор необходимых пакетов для Laravel
RUN docker-php-ext-configure bcmath && \
    docker-php-ext-configure ctype && \
    docker-php-ext-configure curl && \
    docker-php-ext-configure fileinfo && \
    docker-php-ext-configure json && \
    docker-php-ext-configure mbstring && \
    docker-php-ext-configure pcntl && \
    docker-php-ext-configure pdo && \
    docker-php-ext-configure pdo_mysql && \
    docker-php-ext-configure pdo_pgsql && \
    docker-php-ext-configure pgsql && \
    docker-php-ext-configure zip && \
    docker-php-ext-configure tokenizer

# компилируем и устанавливаем
ARG CORES_FOR_COMPILATION
RUN docker-php-ext-install -j$CORES_FOR_COMPILATION \
    bcmath  \
    sockets  \
    ctype \
    curl \
    fileinfo \
    json \
    mbstring \
    pcntl \
    pdo \
    pdo_mysql \
    tokenizer \
    pgsql \
    pdo_pgsql \
    zip


# ставим пару расширений, другим образом
RUN pecl install xdebug igbinary \
    && pecl install --nobuild lzf \
    && cd "$(pecl config-get temp_dir)/LZF" \
    && phpize \
    && ./configure --enable-lzf-better-compression=no \
    && make -j$CORES_FOR_COMPILATION \
    && make install \
    && pecl install --nobuild redis \
    && cd "$(pecl config-get temp_dir)/redis" \
    && phpize \
    && ./configure --enable-redis-igbinary=yes --enable-redis-lzf=yes --enable-redis-zstd=no \
    && make -j$CORES_FOR_COMPILATION \
    && make install \
#    && pecl install memcached \
    && docker-php-ext-enable lzf igbinary xdebug redis \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && pecl install amqp \
    && docker-php-ext-enable amqp
    #memcached


# удаляем пакеты с исходниками
RUN apt-get -y remove libxml2-dev libcurl4-gnutls-dev libssl-dev libonig-dev libpq-dev
#zlib1g-dev libicu-dev g++

# копируем конфиги PHP
COPY php-fpm.d/* $CONFIG_PATH/php-fpm.d/
COPY php.ini $CONFIG_PATH/php.ini
COPY xdebug.ini $CONFIG_PATH/php/

RUN ln -s $CONFIG_PATH/php.ini $CONFIG_PATH/php/php.ini \
    && cat $CONFIG_PATH/php/xdebug.ini >> $CONFIG_PATH/php/conf.d/docker-php-ext-xdebug.ini

WORKDIR $SITE_PATH

# CMD /bin/bash 
# ENTRYPOINT /bin/bash
