# creates a layer from the alpine:3.13 Docker image.
FROM alpine:3.13
EXPOSE 80
EXPOSE 443
# Update the index of available packages
RUN apk update
RUN apk upgrade
# OpenSSH is a suite of secure networking utilities based on the Secure Shell protocol
# which provides a secure channel over an unsecured network in a client–server architecture.
RUN apk add openssh
RUN apk add openssl
# OpenRC is the init system used in alpine. The init system manages the services, startup and shutdown of your computer.
RUN apk add --no-cache openrc
RUN apk add vim
RUN apk add nginx
#create user that the web server will use https://linux.die.net/man/8/adduser
RUN adduser -D -g 'www' www
#setup web server files and permissions
RUN mkdir /www
# change file owner chown [OPTION]... [OWNER][:[GROUP]] FILE...
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY index.html /www/index.html

COPY  /nginx.conf /etc/nginx/nginx.conf
# site : https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-centos-7#step-2-create-the-ssl-certificate
# RUN mkdir /etc/ssl/private
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

RUN mkdir /run/openrc/
RUN touch /run/openrc/softlevel
# vim /etc/nginx/conf.d/default.conf 
# touch /run/openrc/softlevel
# CMD ["sh", "script.sh"]