
FROM alpine:edge

ENV PROFTPD_VERSION 1.3.6rc2

# persistent / runtime deps
ENV PROFTPD_DEPS \
  g++ \
  gcc \
  libc-dev \
  make \
  mariadb-dev

RUN set -x \
    && apk add --no-cache --virtual .persistent-deps \
        ca-certificates \
        curl \
        mariadb-client-libs \
    && apk add --no-cache --virtual .build-deps \
        $PROFTPD_DEPS \
    && curl -fSL ftp://ftp.proftpd.org/distrib/source/proftpd-${PROFTPD_VERSION}.tar.gz -o proftpd.tgz \
    && tar -xf proftpd.tgz \
    && rm proftpd.tgz \
    && mkdir -p /usr/local \
    && mv proftpd-${PROFTPD_VERSION} /usr/local/proftpd \
    && sleep 1 \
    && cd /usr/local/proftpd \
    && sed -i 's/__mempcpy/mempcpy/g' lib/pr_fnmatch.c \
    && ./configure --with-modules=mod_sql:mod_sql_mysql:mod_quotatab:mod_quotatab_sql:mod_sftp:mod_sftp_sql --with-includes=/usr/include/mysql/ \
    && make \
    && cd /usr/local/proftpd && make install \
    && make clean \
    && apk del .build-deps

EXPOSE 20
EXPOSE 21

CMD ["/usr/local/sbin/proftpd", "-n", "-c", "/usr/local/etc/proftpd.conf" ]
