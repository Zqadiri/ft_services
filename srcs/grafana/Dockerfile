FROM	alpine:3.11

RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# COPY	/srcs/telegraf.conf	/etc/telegraf/
COPY	/srcs/start.sh	/

#  command is used to define the working directory of a Docker container at any given time.
WORKDIR	/usr/share/grafana

EXPOSE	3000

COPY start.sh /
CMD ["sh", "/start.sh"]