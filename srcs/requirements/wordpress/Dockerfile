FROM alpine:3.14

RUN apk update
RUN apk add mariadb-client vim curl bash php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl 

ARG DOMAIN_NAME
ARG DIR=/var/www/${DOMAIN_NAME}

WORKDIR ${DIR}

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/setup.sh setup.sh
RUN chmod +x setup.sh

CMD ["/bin/bash", "setup.sh"]