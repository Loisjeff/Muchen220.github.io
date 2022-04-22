#!/bin/bash

IP='192.168.10.1'
LOG='/tmp/bip.txt'

while [ 1 -lt 2 ]
do
sleep 10
BIP=`who -u | grep pts | grep -v '\<$IP\>' | wc -l`

if [ $BIP -ne 0 ]
then
echo '======================' >> $LOG
date >> $LOG
who -u | grep -v '\<$IP\>' >> $LOG
who -u | grep -v '\<$IP\>' | awk '{print $6}' | xargs kill -9
fi
done