FROM	 alpine:3.11
EXPOSE	 3000
RUN 	 apk update 
RUN 	 apk add libc6-compat 
RUN 	 apk add openrc
RUN 	 apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN 	 openrc && touch /run/openrc/softlevel && \
		 rc-update add telegraf
COPY 	 ./grafana-7.4.2.linux-amd64.tar.gz /
RUN 	 tar -zxvf grafana-7.4.2.linux-amd64.tar.gz
RUN 	 mv grafana-7.4.2 /usr/share/grafana
WORKDIR  /usr/share/grafana
COPY 	 /telegraf.conf	/etc/telegraf/
COPY	 /grafana.db /usr/share/grafana/data/grafana.db
COPY 	 start.sh /
COPY 	 health.sh /tmp/health.sh
CMD 	 ["sh", "/start.sh"]
