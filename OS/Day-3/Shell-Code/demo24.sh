#!/bin/bash

# array in bash shell scripting
	# array is a collection of similar data types
	# array index starts from 0
	# array can hold multiple values

# syntax to define an array
	# array_name=(value1 value2 value3 ... valueN)

# ${arr[@]}  => all the values of array
# or
# ${arr[*]}  => all the values of array
# ${#arr[@]} => length of array
# ${arr[index]} => value at index position 

# array of numbers
arr=(10 20 30 40 50)

# get all the values from array
echo "numbers = ${arr[@]}"

# get the length of array
echo "length of numbers = ${#arr[@]}"

# get the  index value of array
echo "arr[0] = ${arr[0]}"
echo "arr[1] = ${arr[1]}"
echo "arr[2] = ${arr[2]}"
echo "arr[3] = ${arr[3]}"

# -------------------------------------------------------
#use for loop to print all the values of array
for num in ${arr[*]}
do
	echo "ele = $num"
done

# -------------------------------------------------------
# append a value to an array
arr+=(60)
echo "numbers = ${arr[@]}"


# -------------------------------------------------------
