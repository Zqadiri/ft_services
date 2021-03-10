#!/bin/sh

# Start Telegraf
telegraf --config /etc/telegraf/telegraf.conf & 

# Create a user <influxdb>
influx -execute "CREATE DATABASE influx_db"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON influx_db TO admin"

# start influxdb
/usr/sbin/influxd
sleep infinity