#!/bin/bash
adduser  user < /psd
rc-status
rc-update 
rc-service sshd restart
rc-service nginx start
/bin/sh
 