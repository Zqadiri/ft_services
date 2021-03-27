#!/bin/sh
# Nginx 
ps | grep -v grep | grep nginx
pr=$?
if [ $pr -ne 0 ];
then
exit $pr;
fi

# Telegraf
ps | grep -v grep | grep telegraf
pr=$?
if [ $pr -ne 0 ];
then
exit $pr;
fi

# php-fpm
ps | grep -v grep | grep php-fpm
pr=$?
if [ $pr -ne 0 ];
then
exit $pr;
fi