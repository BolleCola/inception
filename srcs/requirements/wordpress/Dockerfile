FROM alpine:3.14

RUN apk update
RUN apk add mariadb-client vim curl bash php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN sudo mv wp-cli.phar /usr/local/bin/wp
RUN wp --info

CMD ["sh", "bash"]