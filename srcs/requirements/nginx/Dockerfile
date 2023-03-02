FROM alpine:3.14

LABEL "tpaquier.42.fr"="tpaquier inception"

RUN sudo apk update
RUN sudo apk add nginx openssl vim

COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY /conf/ssl.sh /tmp/ssl.sh

RUN openssl genrsa -des3 -passout pass:x -out server.pass.key 2048 \
    openssl rsa -passin pass:x -in server.pass.key -out server.key \
    rm server.pass.key \
    openssl req -new -key server.key -out server.csr \
      -subj "/C=CH/GE=Geneva/GE=Geneva/O=OrgName/OU=IT Geneva/CN=tpaquier.42.fr" \
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

EXPOSE 443

CMD ["/etc/nginx/nginx.conf", "-g", "daemon off;"]