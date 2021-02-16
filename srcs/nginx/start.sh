#!/bin/bash
adduser  user < /psd
rc-status
rc-update 
rc-service sshd restart
rc-service nginx start
while true
do
    sleep 2;
done