FROM alpine:3.11
EXPOSE 3000
RUN apk add libc6-compat
COPY grafana-7.4.0.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN mv grafana-7.4.0 /usr/share/grafana
COPY start.sh /
CMD ["sh", "/start.sh"]