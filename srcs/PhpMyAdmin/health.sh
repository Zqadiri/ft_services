#!/bin/bash
pgrep nginx
pr_1=$?
pgrep telegraf
pr_2=$?
pgreg php-fpm
pr_3=$?
if [ $pr_1 -eq 0 ] && [ $pr_2 -eq 0 ] && [ $pr_3 -eq 0 ] ; then
        exit 0;
fi
        exit 1;