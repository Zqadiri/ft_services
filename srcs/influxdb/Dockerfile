# https://www.ionos.com/digitalguide/hosting/technical-matters/what-is-influxdb/
FROM alpine:3.11

EXPOSE 8086
RUN apk update 
RUN apk add openrc vim 
RUN apk add influxdb --no-cache
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN openrc && touch /run/openrc/softlevel && \
		rc-update add telegraf
# RUN  mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY start.sh  /start.sh 
RUN chmod +x start.sh
CMD ["sh", "start.sh"]
# ENTRYPOINT sh start.sh 