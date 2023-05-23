FROM alpine:3.14

RUN apk update
RUN apk add nginx openssl vim

RUN	mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private/mykey.key -out /etc/nginx/ssl/certs/mycrt.crt \
      -subj "/C=CH/ST=Geneva/L=Geneva/O=42/OU=42/CN=$DOMAIN"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]