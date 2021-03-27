#!/bin/sh
# Influxd
ps | grep -v grep | grep influxd
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