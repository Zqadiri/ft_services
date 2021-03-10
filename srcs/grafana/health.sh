#!/bin/sh
# grafana 
ps | grep -v grep | grep grafana-server
$pr=$?
if [ $pr -ne 0 ];
then
exit $pr;
fi

# Telegraf
ps | grep -v grep | grep telegraf
$pr=$?
if [ $pr -ne 0 ];
then
exit $pr;
fi