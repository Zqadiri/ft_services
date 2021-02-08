# creates a layer from the alpine:3.13 Docker image.
FROM alpine:3.13

# 80 443 22
EXPOSE 80
EXPOSE 443
EXPOSE 22

# Update the index of available packages
RUN apk update
RUN apk upgrade

# OpenSSH is a suite of secure networking utilities based on the Secure Shell protocol https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/
# which provides a secure channel over an unsecured network in a client–server architecture.
# OpenRC is the init system used in alpine. The init system manages the services, startup and shutdown of your computer.

RUN apk add openssh-server
RUN apk add openssl
RUN apk add --no-cache openrc
RUN apk add vim
RUN apk add nginx

#create user foe the web server  https://linux.die.net/man/8/adduser
RUN adduser -D -g 'www' www

# setup files and permissions
# change file owner chown [OPTION]... [OWNER][:[GROUP]] FILE...
RUN  mkdir /www
RUN  chown -R www:www /www
COPY index.html /www/index.html

# for access_log 
RUN  chown -R www:www /var/lib/nginx
COPY  /nginx.conf /etc/nginx/nginx.conf

# site : https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-centos-7#step-2-create-the-ssl-certificate
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt 

# add user for ssh 
COPY psd /
COPY start.sh /
# RUN rc-status
# RUN rc-service sshd start 

RUN mkdir /run/openrc/
RUN touch /run/openrc/softlevel
CMD ["sh", "/start.sh"]