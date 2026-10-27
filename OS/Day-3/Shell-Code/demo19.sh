#!/bin/bash
# for loop in bash
# bash for loop is a foreach loop.
# It is used to access values one by one from collection of values.

	# syntax :
		# for var in collection
		# do
		#    code
		# done
# collection can be
# 1. list of values separated by space
# 2. range of values {start..end}
# 3. output of command

#-------------------------------------------
# print numbers 1 to 5

echo "Values in collection :"
for var in 1 2 3 4 5 6
do
	echo $var
	
done

#-------------------------------------------


# {..} is called brace expansion in bash. It is used to generate sequence of values.
# {1..5} : is a range of values from 1 to 5 

sum=0
#for var in {1..5}
for var in 1 2 3 4 5
do
	sum=`expr $var + $sum`
	#echo "$var"
done
echo "sum = $sum"

#-------------------------------------------










