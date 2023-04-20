FROM alpine:3.14

RUN apk update
RUN apk add bash vim mariadb mariadb-client

COPY /conf/dbase.sql /dbase.sql
RUN chmod -x /dbase.sql

COPY /conf/database.sh /database.sh
RUN chmod -x /database.sh

COPY /conf/my.cnf /etc/my.cnf
RUN chmod -x /etc/my.cnf

ENTRYPOINT ["/bin/sh", "/database.sh"]