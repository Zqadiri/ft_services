#!/bin/sh

# Start Telegraf and Influxdb.
rc-status
rc-service telegraf start 
/usr/sbin/influxd  & sleep 3

echo "CREATING USER .."
# influx user create -n admin -p admin  
influx -execute "CREATE DATABASE influx_db"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON influx_db TO admin"
# /bin/sh
sleep infinity