# https://github.com/satellitewp/rocket-nginx/wiki/Nginx-configuration-for-WordPress
FROM    alpine:3.11
EXPOSE  5050
# install packages 
RUN     apk update
RUN     apk add wget curl
RUN     apk add vim openrc nginx
RUN     apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN     wget https://wordpress.org/latest.tar.gz 
RUN     tar -zxvf latest.tar.gz 
RUN     rm -rf  latest.tar.gz 
RUN     mkdir -p /var/www/
RUN     mv wordpress /var/www/wordpress

# Telegraf
RUN     apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN     openrc && touch /run/openrc/softlevel
RUN     mkdir -p /etc/telegraf
COPY    telegraf.conf /etc/telegraf/telegraf.conf

# Add user to nginx
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /var/www
RUN     chown -R www:www /var/lib/nginx
RUN     mkdir -p /run/nginx

# nginx configuration file
COPY    nginx.conf /etc/nginx/nginx.conf 


COPY    wp-config.php /var/www/wordpress/wp-config.php
COPY    start.sh /start.sh
COPY    health.sh /tmp/health.sh
RUN     chmod +x start.sh
CMD     ["sh", "start.sh"]
