FROM alpine:3.14

RUN apk update
RUN apk add mariadb-client vim curl bash php7 php-phar php-json php-curl php-fpm php-mysqli php-iconv

ARG DOMAIN_NAME
ARG DIR=/var/www/${DOMAIN_NAME}

WORKDIR ${DIR}

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/php.conf.ini /usr/local/etc/php/conf.d/conf.ini

COPY ./conf/setup.sh setup.sh
RUN chmod +x setup.sh

CMD ["bash", "setup.sh"]