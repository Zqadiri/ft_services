FROM alpine:3.11
EXPOSE 3306

RUN apk update
RUN apk add openrc
RUN apk add mariadb mariadb-client mariadb-common
# RUN apk add mysql mysql-client 
RUN mkdir /run/openrc/
RUN touch /run/openrc/softlevel

# datadir It is the directory where your database files are stored.