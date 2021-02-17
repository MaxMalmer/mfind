#!/bin/bash

# Testscript for Laboration 4 5DV088 HT19
# Max Malmer, c17mmr@cs.umu.se
# Version 1.0, 2019-10-24

if [[ $# -lt 1 ]]
then
    >&2 echo "Error: The program was given 0 arguments, specify the filename"
    exit 1
fi

echo "Starting script to test mfind."

n=1
name=$1
filename=$1
touch "${filename}.txt"

echo "${name}.txt is being written"

while [ $n -le 100 ]
do
  echo "Start Of Test " $n 
  { time ./mfind -p $n /pkg comsol > /dev/null 2>&1 ; } 2>> "${filename}.txt"
  echo "End Of Test " $n 
  ((n++))
done

echo "End of Test "