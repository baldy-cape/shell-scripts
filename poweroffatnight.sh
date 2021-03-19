#!/bin/sh
# Turns system off at sunset and powers back on at sunrise. 
# Use it at home to take advantage of free power from solar panels
# 19 March 2021 laurence.baldwin@gmail.com
# Requires hdate and at
# # apt-get install at hdate
# London is 51 0 and GMT+0
LONG=51
LAT=0
TZ=0
HDATE=$(hdate  -ST -l$LONG -L$LAT -z$TZ -s | tail -1)
SUNRISE=$(echo $HDATE | cut -f3 -d,)
SUNSET=$(echo $HDATE | cut -f4 -d,)
echo "sudo rtcwake -m off -t $(date +%s -d "tomorrow $SUNRISE")" | at $SUNSET
