FROM dosk-phpcli

RUN apt-get update; apt-get install -y supervisor; rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/supervisord"]

EXPOSE tail -f /dev/stdout