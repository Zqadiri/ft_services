#!/bin/bash
# rc-status 
adduser admin < /psd 
rc-update 
rc-service vsftpd start
telegraf &
sleep infinity