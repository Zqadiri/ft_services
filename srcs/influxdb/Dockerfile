FROM alpine:3.11

EXPOSE 8086
RUN apk update 
RUN apk add openrc vim 
RUN apk add influxdb --no-cache
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN openrc && touch /run/openrc/softlevel && \
		rc-update add telegraf

COPY telegraf.conf /etc/
COPY start.sh  /
ENTRYPOINT sh start.sh 