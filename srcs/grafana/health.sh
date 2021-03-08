#!/bin/bash
pgrep telegraf
pr_1=$?
pgrep grafana-server
pr_2=$?
if [$pr_1 -eq 0] && [$pr_2 -eq 0]; then 
    exit 0;
else 
    exit 1; 
fi