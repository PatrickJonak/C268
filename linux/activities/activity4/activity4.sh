#!/bin/bash

#Validates passwords
#Version 1.0

echo Enter password:
read pw
l=${#pw}
c=0

#check if long enough
if (( $l < 8 )); then
	echo Password has only $l characters--too short!
else
	echo Password has $l characters--good length.
	c=$((c += 1 ))
fi

#check for upper and lower case letters
if [[ $pw =~ [a-z] && $pw =~ [A-Z] ]]; then
	echo Password has both upper and lower case.
	c=$((c += 1))
else 
	if [[ $pw =~ [a-z] ]]; then
		echo Password has only lower case.

	elif [[ $pw =~ [A-Z] ]]; then 
		echo Password has only upper case.
	else
		echo Password has no letters!
	fi
fi

#check for numbers
if [[ $pw =~ [0-9] ]]; then
	echo Password has numbers.
	c=$((c += 1 ))
else 
	echo Password has no numbers.
fi

#let user know how secure their password is
echo Password matched $c/3 criteria. 

# return exit code 
if (( $c == 3 )); then
	exit 0
else 
	exit 1
fi



