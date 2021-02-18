#!/bin/sh

# Start Telegraf and Influxdb.
rc-status
rc-service telegraf start 
# influxd
/bin/sh
# sleep infinity