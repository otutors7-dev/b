#!/bin/bash

# Title     : Find the Greatest Number
# Objective : To find the greatest among three numbers
#             using nested if-else statements.

echo -n "Enter 3 Num : "
read -r n1 n2 n3

# Compare n1 and n2
if [ "$n1" -gt "$n2" ]
then
	# n1 is greater than n2
	if [ "$n1" -gt "$n3" ]
	then
		echo "N1 is greater : $n1"
	else
		echo "N3 is greater : $n3"
	fi

else
	# n2 is greater than or equal to n1
	if [ "$n2" -gt "$n3" ]
	then
		echo "N2 is greater : $n2"
	else
		echo "N3 is greater : $n3"
	fi
fi