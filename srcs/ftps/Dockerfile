FROM    alpine:3.11
RUN     apk update
RUN     apk add vsftpd vsftpd-doc
RUN     apk add vim openrc openssl --no-cache

# Add FTP configuration
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf

# Openrc
RUN     openrc && touch /run/openrc/softlevel

# Telegraf
RUN     apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
COPY    telegraf.conf /etc/telegraf/telegraf.conf

# Add SSL cert
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

# Add user 
COPY    /psd /

EXPOSE  21 21010 21011
COPY    start.sh /start.sh
RUN     chmod +x start.sh
CMD     ["sh", "start.sh"]