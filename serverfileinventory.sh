#!/bin/bash

#This script is used to check a recently installed server
#April 2021 by brice

## CPU check
CPU_N=$(nproc)

if [ ${CPU_N} -lt 2 ]
then
echo "CPU check failed"
else
echo "CPU check pass"
fi

sleep 1

## The total memory
mem=$(free -m |grep Mem | awk '{print$2}')
if [ ${mem} -lt 2000 ]
then
echo " The memory check failed "
else
echo " The memory check passed "
fi

sleep 1

## If file /etc/group exists

if [ -f /etc/group ]
then
echo " File /etc/group exists "
else
echo " File /etc/passwd missing "
fi

sleep 1

# Check if /etc/passwd exists

if [ -f /etc/passwd ]
then
echo " File /etc/passwd exist "
else
echo " File /etc/passwd missing "
fi

sleep 1

# Check if /etc/httpd exists

if [ -f /etc/httpd ]
then
echo " File /etc/httpd exist "
else
echo " File /etc/httpd missing "
fi

sleep 1

## Check if /etc/kubernetes exists

if [ -f /etc/kubernetes ]
then
echo " File /etc/kubernetes exists "
else
echo " File /etc/kubernetes missing "
fi

sleep 1

## Check if the user puppet exist

id puppet
if [ $? -eq 0 ]
then
echo " User puppet exists "
else
echo " User puppet missing "
fi

sleep 1

## Check the first digit of the kernel

K=$(uname -r |awk -F. '{print$1}')
if
[ ${K} -lt 3 ]
then
echo " This systems kernel is not up to date"
else
echo " This system kernel is up to date "
fi
