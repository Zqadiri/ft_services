#!/bin/bash
openrc default
rc-status
rc-service php-fpm7 start
rc-update 
rc-service nginx restart
sleep infinity
# /bin/sh