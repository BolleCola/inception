FROM alpine:3.14

RUN apk update
RUN apk add bash vim mariadb mariadb-client

COPY /conf/database.sh /
RUN chmod -x /database.sh

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/database.sh"]