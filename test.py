#!/usr/bin/python
for i in `seq 2 10`;
do
    for a in `seq 1 10`;
    do
	{ time ./mfind -p $i /pkg comsol > /dev/null 2>&1 ; } 2>> test.txt
    done
done 

import os
import sys
import csv
import datetime
import time
 
#run speedtest-cli
print 'running test'
speed = os.popen("speedtest-cli --simple").read()
print 'done'
#split the 3 line result (ping,down and up)
lines = speed.split('\n')
print speed
ts = time.time()
now = time.strftime('%d-%m-%Y %H:%M:%S')
#if speedtest could not connect set the speeds to 0
if "Cannot" in speed:
	p = 0
	d = 0
	u = 0
#extract the values for ping, down and up values
else:
    p = lines[0][6:11]
    d = lines[1][10:16]
    u = lines[2][8:12]
print now,p, d, u
#save the data to a csv
out_file = open('speed.csv', 'a')
writer = csv.writer(out_file)
writer.writerow((now,p,d,u))
out_file.close()