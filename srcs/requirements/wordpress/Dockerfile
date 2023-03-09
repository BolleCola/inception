FROM alpine:3.14

RUN apk-update
RUN apk add mariadb-client vim curl bash php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl 

#RUN wget http://wordpress.org/latest.tar.gz
#COPY latest.tar.gz /tmp/wordpress/latest.tar.gz
#RUN tar -xzvf /tmp/wordpress/latest.tar.gz
#RUN rm latest.tar.gz && rm /tmp/wordpress/latest.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-cli.phar /tmp/wordpress/wp-cli.phar
RUN chmod +x /tmp/wordpress/wp-cli.phar
RUN mv /tmp/wordpress/wp-cli.phar /usr/bin/wp/wp-cli.phar

CMD ["sh", "bash"]