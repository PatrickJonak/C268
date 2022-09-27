#!/bin/bash

#Program for generating lottery numbers between 1-50
#Version 1.0

#Define variables
results=()
filename="lottery.$(date +%y.%m.%d).txt"

#Pick 5 numbers
for ((i=0;i<5;i++))
do	
	results+=($(( $RANDOM % 50 + 1 )))
done

results+=($(( $RANDOM % 10 + 1 )))

#Check if file already exists, remove if so
if [ -f $filename ];then
	echo `rm -rf $filename`
fi

#Save numbers into file
for ((i=0;i<6;i++))
do
	echo ${results[i]} >> $filename
done

exit 0

