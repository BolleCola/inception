FROM alpine:3.14

RUN cd /conf
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN apk add apache2-proxy php8-fpm

EXPOSE 9000