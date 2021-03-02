#!/bin/bash
adduser admin < /psd 
rc-update 
rc-service vsftpd start
telegraf &
sleep infinity