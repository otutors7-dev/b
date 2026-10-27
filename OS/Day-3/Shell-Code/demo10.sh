#!/bin/bash

# Title     : Find Maximum of Two Numbers
# Objective : To find the greater number using if-elif-else.

# Accept two numbers from the user
echo "Enter the num1 : "
read -r num1

echo "Enter the num2 : "
read -r num2

# Compare the two numbers
if [ "$num1" -gt "$num2" ]
then
	echo "Num1 is greater : $num1"
elif [ "$num2" -gt "$num1" ]
then
	echo "Num2 is greater : $num2"
else
	echo "Both numbers are equal"
fi