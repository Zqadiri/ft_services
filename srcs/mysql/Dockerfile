FROM    alpine:3.11
EXPOSE  3306
# Add packages
RUN     apk update
RUN     apk add openrc vim 
RUN     apk add mariadb mariadb-client 
RUN     mkdir /run/openrc/
RUN     touch /run/openrc/softlevel

# Telegraf
RUN     apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN     openrc && touch /run/openrc/softlevel
RUN     mkdir -p /etc/telegraf
COPY    telegraf.conf /etc/telegraf/telegraf.conf

# configuration 
COPY    /phpmyadmin.sql /
COPY    /wp_db.sql /
COPY    mariadb-server.cnf  /etc/my.cnf.d
COPY    start.sh /start.sh
COPY    health.sh /tmp/health.sh

RUN     chmod +x start.sh
CMD     ["sh", "start.sh"]