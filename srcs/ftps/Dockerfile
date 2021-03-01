FROM    alpine:3.11
RUN     apk update
RUN     apk add vsftpd
# RUN     apk add vsftpd-doc
RUN     apk add vim openrc openssl --no-cache

# Add FTP configuration
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf

# Openrc
RUN     openrc && touch /run/openrc/softlevel

# Telegraf
RUN     apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
COPY    telegraf.conf /etc/telegraf/telegraf.conf

COPY    /psd /
COPY    start.sh /start.sh
RUN     chmod +x start.sh
CMD     ["sh", "start.sh"]