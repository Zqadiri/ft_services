#!/bin/bash
rc-status
rc-update 
rc-service sshd restart
nginx -g "daemon off;"
/bin/sh
 