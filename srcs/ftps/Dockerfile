FROM alpine:3.11
RUN apk add vsftpd
RUN apk add vsftpd-doc
RUN apk add vim openrc
COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ["sh", "start.sh"]