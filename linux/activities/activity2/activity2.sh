#!/bin/bash

path=`pwd`
date=`date +%y.%m.%d`
file=`ls | awk -F"\n" '{print $1}'`

echo $path
echo $date
echo $file

exit 0
