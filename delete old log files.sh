#!/bin/bash

#Description: Delete logs 14 days old from /var/log
#Author:Brice     #Date: April 2021

find /var/log -mtime +14 -type f -Delete
exit 0
