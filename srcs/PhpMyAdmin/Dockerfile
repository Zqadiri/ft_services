FROM    alpine:3.11
EXPOSE  5000

# install packages 
RUN     apk update
RUN     apk add wget curl
RUN     apk add vim openrc nginx
RUN     apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN     wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz 
RUN     tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN     rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     mkdir -p /var/www/
RUN     mv phpmyadmin /var/www/phpmyadmin

# Telegraf 
RUN     apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN     openrc && touch /run/openrc/softlevel
RUN     mkdir -p /etc/telegraf
COPY    telegraf.conf /etc/telegraf/telegraf.conf

# configuration
COPY    config.inc.php /var/www/phpmyadmin

# Add user for my nginx
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /var/www
RUN     chown -R www:www /var/lib/nginx
RUN     mkdir -p /run/nginx

# configuration
RUN     mkdir /var/www/phpmyadmin/tmp/
RUN     chmod 777 /var/www/phpmyadmin/tmp/
COPY    nginx.conf /etc/nginx/nginx.conf 

COPY    health.sh /tmp/health.sh
COPY    start.sh /start.sh
RUN     chmod +x start.sh
CMD     ["sh", "start.sh"]