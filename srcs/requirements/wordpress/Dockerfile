FROM alpine:3.14

RUN cd /conf
RUN wget http://wordpress.org/latest.tar.gz
COPY latest.tar.gz /tmp/wordpress/latest.tar.gz
RUN tar -xzvf /tmp/wordpress/latest.tar.gz
RUN rm latest.tar.gz && rm /tmp/wordpress/latest.tar.gz
RUN apk add php8-fpm

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-cli.phar /tmp/wordpress/wp-cli.phar
RUN chmod +x /tmp/wordpress/wp-cli.phar
RUN sudo mv /tmp/wordpress/wp-cli.phar /usr/local/bin/wp


EXPOSE 9000