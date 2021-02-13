FROM alpine:3.11
EXPOSE 3306

RUN apk update
RUN apk add openrc
# RUN apk add mariadb mariadb-client mariadb-common
RUN apk add mysql mysql-client 
RUN mkdir /run/openrc/
RUN touch /run/openrc/softlevel
RUN mkdir -p /var/lib/mysql /run/mysqld/
# RUN /etc/init.d/mariadb setup

# datadir It is the directory where your database files are stored.
COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ["sh", "start.sh"]