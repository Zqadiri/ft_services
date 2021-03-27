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

# SSH 
ps | grep -v grep | grep sshd
pr=$?
if [ $pr -ne 0 ];
then
exit $pr;
fi