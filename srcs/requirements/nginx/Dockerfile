FROM alpine:3.14

RUN apk update
RUN apk add nginx openssl vim

COPY ./conf/nginx.conf /var/nginx/nginx.conf

RUN mkdir /etc/nginx/key/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/key/mykey.key -out /etc/nginx/key/mycrt.crt \
      -subj "/C=CH/ST=Geneva/L=Geneva/O=tpaquier/OU=42/CN=tpaquier.42.fr"
    
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]