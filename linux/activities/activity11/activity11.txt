#!/bin/bash

#Orders list of positive integers 
#Version 1.1

#Read filepath from user 
echo Please give input file path
read filepath

#Check user input for error
until [[ -f "$filepath" ]]
do
	echo Filepath not found, please try again!
	read filepath
done

#Add line numbers to file using cat
#Sort input not counting line numbers and remove duplicates
#Sort line numbers numerically 
#Remove line numbers and write to temp file 
#Print contents in reverse using tac
#(Solution found partly online)
`cat -n $filepath | sort -uk2 | sort -nk1 | cut -f2- > temp`
echo `tac temp`

exit 0 

