#!/bin/bash

# Title     : Arithmetic Operations in Bash
# Objective : To perform arithmetic operations using expr
#             and the $(( )) arithmetic expansion.

# We can perform arithmetic operations using:
# 1. expr command
# 2. $(( )) arithmetic expansion

# expr is an external command, whereas $(( )) is a built-in
# shell feature and is generally faster.

# Syntax:
#   res=`expr arg1 operator arg2`
#   res=$(( expression ))

echo "Enter The Two Numbers : "
read n1 n2

# Addition
sum=`expr $n1 + $n2`
# Or
sum=$((n1 + n2))
echo "sum : $sum"

# Subtraction
sub=`expr $n1 - $n2`
# Or
sub=$((n1 - n2))
echo "sub : $sub"

# Multiplication
# Escape * because expr treats it as a special pattern
mul=`expr $n1 \* $n2`
# Or
mul=$((n1 * n2))
echo "mul : $mul"

# Division

div=`expr $n1 / $n2`
# Or
div=$((n1 / n2))
echo "div : $div"
