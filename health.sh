#!/bin/bash
# ps displays information about a selection of the active processes.
# To see every process on the system using standard syntax: ps -e
# 
if [ $(ps -e | grep -v grep | grep my-program | wc -l) -lt 2 ]; then
  exit 1
else
  exit 0
fi