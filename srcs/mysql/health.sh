#!/bin/bash
ps | grep -v grep | grep mysqld
$r=$?
if [ $r -ne 0 ];
then
exit $r;
fi

ps | grep -v grep | grep telegraf
$r=$?
if [ $r -ne 0 ];
then
exit $r;
fi