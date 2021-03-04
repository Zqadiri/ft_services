# https://hub.docker.com/_/wordpress
# https://github.com/satellitewp/rocket-nginx/wiki/Nginx-configuration-for-WordPress
FROM alpine:3.11
EXPOSE 5000
# install packages 
RUN  apk update
RUN  apk add wget curl
RUN  apk add vim openrc nginx
# RUN  apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl \
#         php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
#         php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom 
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz 
RUN  tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN  mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN  rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN  mkdir -p /var/www/
RUN  mv phpmyadmin /var/www/phpmyadmin

# Telegraf 
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN openrc && touch /run/openrc/softlevel
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf


COPY  config.inc.php /var/www/phpmyadmin

RUN  adduser -D -g 'www' www
RUN  chown -R www:www /var/www
RUN  chown -R www:www /var/lib/nginx
RUN  mkdir -p /run/nginx

RUN mkdir /var/www/phpmyadmin/tmp/
RUN chmod 777 /var/www/phpmyadmin/tmp/
COPY nginx.conf /etc/nginx/nginx.conf 

COPY health.sh /tmp/health.sh
COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ["sh", "start.sh"]