FROM postgres:13.2
RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8

COPY postgresql.conf /etc/postgresql/postgresql.conf
#RUN chmod g+rwx -R /var/lib/postgresql/data