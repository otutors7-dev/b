#!/bin/bash

# Title     : Positive, Negative or Zero
# Objective : To check whether the given number is positive,
#             negative or zero using if-elif-else.

echo -n "Enter the num : "
read  num

# Check whether the number is greater than zero
if [ "$num" -gt 0 ]
then
	echo "Num is +ve"

# Check whether the number is less than zero
elif [ "$num" -lt 0 ]
then
	echo "Num is -ve"

# If both conditions are false, the number is zero
else
	echo "Num is ZERO"
fi