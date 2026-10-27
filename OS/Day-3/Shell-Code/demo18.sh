#!/bin/bash


# 2. until loop
# In until loop, if condition is false, loop body is repeated.
# If condition is true, it comes out of loop.
	# syntax :
		# initialization
		# until [ condition ]    ...itration till condition is false
		# do
		#	code
		#	modification
		# done



# printf table of given num

echo "Enter num :"
read num
i=1

until [ $i -gt  10 ] 
do
	res=`expr $i \* $num`
	echo "$res"
	i=`expr $i + 1`

done












