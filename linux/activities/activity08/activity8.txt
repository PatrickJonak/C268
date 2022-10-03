#!/bin/bash

#Program for calculating different combinations of integers

#Declare variables
count=0
product=1
average=0
sum=0
min=0
max=0
numbers=()

#Prompt user
echo Enter between 5 and 10 integers.

#Collect first 5 integers
while [ $count -le 4 ]
do

	echo "Type an integer:"
	read temp 


	if ! [[ $temp =~ ^[0-9]+$ ]]; then
		echo $temp "is not an integer!"
	else
		numbers+=($temp)
		count=$((count+1))
	fi

done 

#Collect additional integers if user wishes to continue
while [ $count -le 9 ]
do

	echo "Continue?(y/n)"
	read temp 

	while ! [[ $temp =~ ^[yYnN]$ ]]
	do
		echo "Please type y or n."
		read temp
	done

	if [[ $temp =~ ^[nN]$ ]]; then
		break
	fi

	echo "Type an integer:"
	read temp 

	if ! [[ $temp =~ ^[0-9]+$ ]]; then
		echo $temp "is not an integer!"
	else
		numbers+=($temp)
		count=$((count+1))
	fi
	
done 

#Save length of array
l=${#numbers[@]}

#Calculate product of numbers
for (( i=0;i<l;i++))
do
	product=$((product * ${numbers[i]}))
done

#Calculate sum  of numbers
for (( i=0;i<l;i++))
do
	sum=$((sum + ${numbers[i]}))
done

#Calculate average of numbers
average=$((sum / l))

#Find max of numbers
for (( i=0;i<l;i++))
do
	if (( ${numbers[i]} > $max )); then
		max=${numbers[i]}
	fi
done

#Find min of numbers
min=$max
for (( i=0;i<l;i++))
do
	if (( ${numbers[i]} < $min )); then
		min=${numbers[i]}
	fi
done

echo Input is ${numbers[@]}
echo Product is $product
echo Average is $average
echo Sum is $sum
echo Min is $min
echo Max is $max

exit 0
