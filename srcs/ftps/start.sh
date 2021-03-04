#!/bin/bash
# sh health.sh
adduser admin < /psd 
rc-update 
rc-service vsftpd start
telegraf &
sleep infinity