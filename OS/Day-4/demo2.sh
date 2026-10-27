#!/bin/bash


#-------------------------------------------
# comare two string

echo "enter Two string : "
read str1 str2

if [ $str1 = $str2 ]
then
	echo "Both string are equal"
else
	echo "Not equal.."
fi

#----------------------------------------------


# check string palindrome

echo "Enter the string : "
read str1

temp=$str1
str1=`echo "$str1" | rev`

if [ $str1 = $temp ]
then
	echo "$temp is plaindrome"
else
	echo "$temp is not palindrome"
fi
#-------------------------------------















