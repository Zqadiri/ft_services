FROM 	alpine:3.11
EXPOSE 	8086

# packages
RUN 	apk update 
RUN 	apk add openrc vim 
RUN 	apk add libc6-compat
RUN 	apk add influxdb --no-cache  --repository http://dl-2.alpinelinux.org/alpine/edge/community

# Telegraf
RUN 	apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN 	openrc && touch /run/openrc/softlevel && \
		rc-update add telegraf
COPY 	telegraf.conf /etc/telegraf/telegraf.conf

COPY 	start.sh  /start.sh 
COPY 	health.sh /tmp/health.sh
RUN 	chmod +x start.sh
CMD 	["sh", "start.sh"]