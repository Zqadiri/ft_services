# https://hub.docker.com/_/wordpress
# https://github.com/satellitewp/rocket-nginx/wiki/Nginx-configuration-for-WordPress
FROM alpine:3.11

# install packages 
RUN  apk update
RUN  apk add wget curl
RUN  apk add vim openrc nginx
# RUN  apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl \
#         php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
#         php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom 
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN wget https://wordpress.org/latest.tar.gz 
RUN  tar -zxvf latest.tar.gz 
RUN  rm -rf  latest.tar.gz 
RUN  mkdir -p /var/www/
RUN  mv wordpress /var/www/wordpress

RUN  adduser -D -g 'www' www
RUN  chown -R www:www /var/www
RUN  chown -R www:www /var/lib/nginx
RUN  mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf 



COPY wp-config.php /var/www/wordpress/wp-config.php
# RUN apk add wget php5-mysql mysql mysql-client php5-zlib 
COPY start.sh /
# RUN touch /run/openrc/softlevel
EXPOSE 5050
# ENTRYPOINT sh start.sh
# CMD sh start.sh