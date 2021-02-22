FROM	alpine:3.11

# RUN	apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache 
# RUN	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# COPY	/srcs/telegraf.conf	/etc/telegraf/
COPY	/start.sh	/
#  command is used to define the working directory of a Docker container at any given time.
# WORKDIR	/usr/share/grafana
EXPOSE	3000
RUN apk update
RUN apk add libc6-compat
COPY ./grafana-7.4.2.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.4.2.linux-amd64.tar.gz
RUN mv grafana-7.4.2 /usr/share/grafana
COPY start.sh /
CMD ["sh", "/start.sh"]
