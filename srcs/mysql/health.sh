#!/bin/bash
# mysqld
ps | grep -v grep | grep mysqld
$r=$?
if [ $r -ne 0 ];
then
exit $r;
fi

# Telegraf
ps | grep -v grep | grep telegraf
$r=$?
if [ $r -ne 0 ];
then
exit $r;
fi