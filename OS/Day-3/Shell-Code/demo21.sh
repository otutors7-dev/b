#!/bin/bash

# Title     : Functions in Bash
# Objective : To demonstrate function definition, function
#             arguments, and capturing function output.

# Function syntax:
#
# Function definition:
#   function fun_name()
#   {
#       code
#   }
#
# Function call:
#   fun_name

#---------------------------------------------------
# Example 1: Function without arguments

# Function definition
function fun_msg()
{
	echo "Msg from fun body.."
}

echo "Msg from Outside the fun.."

# Function call
fun_msg


#---------------------------------------------------
# Example 2: Function with an argument

# In a function:
#   $1 -> First argument
#   $2 -> Second argument
#   $3 -> Third argument
#
# Function call:
#   fun_name arg1 arg2 arg3

function sqr()
{
	n=$1
	res=$(expr "$n" \* "$n")
	echo "sqr : $res"
}

echo "Enter the num : "
read -r num

# Pass num as an argument to the function
sqr "$num"


#---------------------------------------------------
# Example 3: Capture function output in a variable

# echo displays the result.
# Command substitution $(...) captures the output
# produced by the function.

# Example:
#   res=$(fun_name arg1)

function sqr()
{
	n=$1
	res=$(expr "$n" \* "$n")
	echo "$res"
}

echo "Enter the num : "
read -r num

# Capture the function output in var
var=$(sqr "$num")

echo "sqr : $var"