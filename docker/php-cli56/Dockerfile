FROM dosk-phpfpm56

ARG SITE_PATH

ENV CRON_TASKS /etc/cron.d/tasks
ENV CRON_LOG /var/log/cron.log

RUN apt-get update; apt-get install -y git; apt-get install -y --no-install-recommends cron; rm -rf /var/lib/apt/lists/*

# ADD crontab $CRON_TASKS
# RUN chmod 0644 $CRON_TASKS; touch $CRON_LOG
RUN touch $CRON_LOG

ENV LOG_FILE $SITE_PATH/storage/logs/laravel.log

# ENTRYPOINT chown -R nginx:nginx .* && chown -R nginx:nginx * && cron && php artisan horizon
# ENTRYPOINT chmod -R g+w * && chown -R nginx:nginx * && php artisan horizon

# Start as root
USER root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID
ARG USER_NAME

RUN useradd -u ${PUID} -g nginx -m ${USER_NAME} -s /bin/bash -p "*"
#RUN groupadd -g ${PGID} ${GROUP_NAME} && \
#    useradd -u ${PUID} -g ${GROUP_NAME} -m ${USER_NAME} -s /bin/bash -p "*"

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc && \
        composer --version

#USER container_user
#COPY ./composer.json $SITE_PATH/composer.json
#RUN composer install --prefer-source --no-interaction
#RUN chmod +x ${SITE_PATH}

ENTRYPOINT cron; tail -f /dev/stdout