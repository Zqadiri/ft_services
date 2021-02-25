#!/bin/bash
openrc default
rc-status
rc-service php-fpm7 start
rc-update 
rc-service nginx restart
rc-service telegraf start
telegraf --config /etc/telegraf/telegraf.conf
sleep infinity
# /bin/sh