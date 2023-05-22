FROM alpine:3.14

RUN apk update
RUN apk add bash vim mariadb mariadb-client

RUN mkdir -p /var/lib/mysqld /run/mysqld

COPY /conf/dbase.sql /tmp/dbase.sql
RUN chmod +x /tmp/dbase.sql

COPY /conf/database.sh /database.sh
RUN chmod +x /database.sh

COPY /conf/my.cnf /etc/my.cnf
RUN chmod +x /etc/my.cnf

ENTRYPOINT ["/bin/sh", "/database.sh"]