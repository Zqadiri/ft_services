#!/bin/bash
rc-status
rc-service php7-fpm start
rc-update 
rc-service nginx restart
nginx -g "daemon off;"
/bin/sh
