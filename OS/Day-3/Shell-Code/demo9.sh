#!/bin/bash

#----------------------------
# man test
#----------------------------
# Operators in bash
	# Relational opr
		# ==  => -eq   # equal
		# !=  => -ne   # not equal
		#  <  => -lt   # less than
		# <=  => -le   # less than equal
		#  >  => -gt   # greater than
		# >=  => -ge   # greater than equal
		
		

	# logical opr
		# && => -a   # logical and
		# || => -o   # logical or
		# !  => !    # logical not


# Here logical opr and relational opr used in if condition
# In shell scripting condition slove using test command
   # syntax : test condition
	  	# e.g : test $num1 -gt $num2
   #OR
   # we can use [ ] instead of test command
	  	# syntax : [ condition ]
			# e.g : [ $num1 -gt $num2 ]
				 
# if else in bash script
	# syntax :                  or   # syntax :
		# if [ condition ]           # if test condition
		# then                       # then
		#	code					 #		code	
		# else           			 # else
		#	code                     #		code
		# fi                         # fi                      # fi is end of if condition

# if else - else if
	# syntax :
		# if [ condition1 ]
		# then
		#	code1
		# elif [ condition2 ]
		# then
		#	code2
		# elif [ condition ]
		# then
		#	code3  
		# else
		#	code4
		# fi

# nested if else
	# syntax :
		# if [ condition1 ]
		# then
		#		code1
		#		if [ condition2 ]
		#		then
		#			code2
		#		else
		#			code3
		#		fi
		# else
		#	code4
		# fi


# Check Given num EVEN or ODD

echo "Enter the Num : "
read num

# if (num % 2 == 0)
#if test `expr $num % 2` -eq 0 
#OR
if [ `expr $num % 2` -eq 0 ]
then
	echo "Num is even : $num"
else
	echo "Num is ODD  : $num"
fi


























