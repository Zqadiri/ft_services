#!/bin/bash
adduser user < /psd
# /bin/sh -c "touch /tmp/healthy; sleep 30; rm -rf /tmp/healthy; sleep 600"
rc-status
rc-update 
rc-service sshd restart
rc-service nginx start
rc-service telegraf start 
telegraf --config /etc/telegraf/telegraf.conf
sleep infinity