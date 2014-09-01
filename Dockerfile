FROM phusion/baseimage:0.9.13
MAINTAINER Nicolas Tresegnie <nicolas.tresegnie@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends postgresql-9.3 postgresql-contrib-9.3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.npm

RUN echo "host    all             all             0.0.0.0/0               md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf

ADD ./etc/service/postgresql /etc/service/postgresql

ADD ./sbin/backup /sbin/backup
RUN mkdir -p /data/backups/
RUN echo "0 * * * * /sbin/backup >>/var/log/cronrun 2>&1" | crontab -

VOLUME ["/data/database"]
VOLUME ["/data/backups/full"]
EXPOSE 5432
CMD ["/sbin/my_init"]
