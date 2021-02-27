#!/bin/sh

# Start Telegraf and Influxdb.
rc-status
telegraf --config /etc/telegraf/telegraf.conf & 

echo "CREATING USER .."
# influx user create -n admin -p admin  
influx -execute "CREATE DATABASE influx_db"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON influx_db TO admin"
/usr/sbin/influxd
# /bin/sh
sleep infinity