#!/bin/bash
adduser  user < /psd
rc-status
rc-service sshd restart
/bin/sh
 