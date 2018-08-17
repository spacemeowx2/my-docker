#!/bin/sh

aria2c -D

while sleep 60; do
    ps aux |grep aria2c |grep -q -v grep
    PROCESS_ARIA2_STATUS=$?
    if [ $PROCESS_ARIA2_STATUS -ne 0 ]; then
        echo "One of the processes has exited"
        exit 1
    fi
done
