FROM alpine:3.14

RUN apk-update
RUN apk add mariadb-client vim curl bash php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-cli.phar /tmp/wordpress/wp-cli.phar
RUN chmod +x /tmp/wordpress/wp-cli.phar
RUN mv /tmp/wordpress/wp-cli.phar /usr/bin/wp/wp-cli.phar

EXPOSE 9000

CMD ["sh", "bash"]