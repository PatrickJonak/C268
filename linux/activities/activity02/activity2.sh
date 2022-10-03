#!/bin/bash

path=`pwd`
date=`date +%y.%m.%d`
files=() 

#Read directory contents 
ls > directory
echo `cat directory`
#readarray -t files 

echo $path
echo $date
echo $file

exit 0
