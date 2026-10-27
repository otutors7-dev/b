#!/bin/bash

# Title     : Factorial of a Number
# Objective : To find the factorial of a given number
#             using a while loop.

# Example:
# 5! = 1 * 2 * 3 * 4 * 5 = 120

echo -n "Enter the num : "
read  num

i=1
fact=1

# Multiply numbers from 1 to num
while [ "$i" -le "$num" ]
do
	# Calculate factorial
	fact=`expr "$fact" \* "$i"`

	# Increment i by 1
	i=`expr "$i" + 1`
done

echo "$num : $fact"