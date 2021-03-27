#!/bin/bash
# mysqld
ps | grep -v grep | grep mysqld
pr=$?
if [ $r -ne 0 ];
then
exit $r;
fi

# Telegraf
ps | grep -v grep | grep telegraf
pr=$?
if [ $r -ne 0 ];
then
exit $r;
fi