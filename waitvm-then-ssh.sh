#!/bin/bash
HOST=$1

if [ $# -ne 1 ]
then
echo "Usage: $0 <hostname>"
exit 1
fi

echo -n 'wait on ping:'

ping -c 1 $HOST > /dev/null 2>&1
RET=$?
while [ $RET -ne 0 ]
do
echo -n '.'
sleep 10
ping -c 1 $HOST > /dev/null 2>&1
RET=$?
done

echo ' ok'

echo -n 'wait on ssh:'
ssh $HOST "uptime" > /dev/null 2>&1 
RET=$?
while [ $RET -ne 0 ]
do
echo -n '.'
sleep 10
ssh $HOST "uptime" > /dev/null 2>&1 
RET=$?
done
echo ' ok'

echo "Logging in to $HOST"

ssh $HOST