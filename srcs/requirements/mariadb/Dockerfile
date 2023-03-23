FROM alpine:3.14

RUN sudo apk update
RUN sudo apk bash vim mariadb mariadb-client

COPY /conf/database.sh /database.sh
RUN chmod -x /database.sh

ENTRYPOINT [ "/bin/sh", "/database.sh"]