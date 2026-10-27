#!/bin/bash

## Loops in shell scripting
# Two types of loops
# 1. while loop
# 2. until loop
# 3. for loop

# 1. while loop
# In while loop, if condition is true, loop body is repeated.
# If condition is false, it comes out of loop.
	# syntax :
		# initialization
		# while [ condition ]    ...itration till condition is true
		# do
		#	code
		#	modification
		# done


# printf 1 to 5

i=1
while [ $i -le 5 ]
do
	echo "$i"
	i=`expr $i + 1`
done

