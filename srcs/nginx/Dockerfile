FROM    alpine:3.11
EXPOSE  80
EXPOSE  443
EXPOSE  22

# Add packages
RUN     apk update
RUN     apk upgrade
RUN     apk add openssh-server
RUN     apk add openssl
RUN     apk add --no-cache openrc
RUN     apk add vim
RUN     apk add nginx

# Telegraf
RUN     apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN     openrc && touch /run/openrc/softlevel
RUN     mkdir -p /etc/telegraf
COPY    telegraf.conf /etc/telegraf/telegraf.conf

# Add nginx user 
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /var/www
COPY    index.html /var/www/index.html
RUN     chown -R www:www /var/lib/nginx

# configuration
COPY    /nginx.conf /etc/nginx/nginx.conf

# openssl
RUN     yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt 

# add user for ssh 
COPY    psd /

COPY    start.sh /
COPY    health.sh /tmp/health.sh
CMD     ["sh", "/start.sh"]