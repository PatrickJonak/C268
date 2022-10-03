#!/bin/bash

#Script for checking user input lottery numbers
#Version 1.0

#Declare variables 
lottery_num=()
lottery_results=()
filename="lottery.$(date +%y.%m.%d.)txt"


#Loop until user inputs six numbers 
while [[ ${#lottery_num[@]} < 6 ]]
do
	#Read numbers from terminal
	echo Please type your lottery number:
	read temp

	#For first 5 entries check if the numbers is between 1-50
	#For last entry check if number is between 1-10
	#Else print error message and loop until correct input
	if [[ ${#lottery_num[@]} < 5 ]]; then
		until [[ ($temp =~ ^[0-4][0-9]$ || $temp =~ ^[5][0]$
			|| $temp =~ ^[0-9]$) && !($temp =~ ^[0][0]$) ]]
		do
			echo Lottery number should be between 1-50:
			read temp 
		done
	else 
		until [[ $temp =~ ^[1-9]$ || $temp =~ ^[1][0]$ ]]
		do
			echo Last number should be between 1-10:
			read temp
		done
	fi

	#Save user input into array
	lottery_num+=($temp)
done

#Print user input back to user 
echo Your numbers: ${lottery_num[@]}

#Check if lottery numbers file was created
if ! [ -f $filename ];then
	echo `./activity3.sh` 
fi

#Read numbers from file 
readarray -t lottery_results < $filename
echo Lottery numbers: ${lottery_results[@]}

#Check for matches 
ln=" ${lottery_num[*]} "
count=0
for num in ${lottery_results[@]}
do
	if [[ $ln =~ " $num " ]]; then
		count=$((count + 1))
	fi
done

echo You have $count matches 

exit 0





