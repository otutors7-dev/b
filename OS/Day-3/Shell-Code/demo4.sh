#!/bin/bash

# Title     : Variables in Bash
# Objective : To declare, initialize, and access variables
#             in a shell script.

# Variable declaration and initialization:
# In Bash, we can assign a value directly to a variable.
# No need to specify the data type.
# No need to use ; at the end of a line.

# Syntax:
#   var_name=value
#
# No spaces before or after the = sign.
#
# To access the value of a variable, use the $ sign.
# Syntax:
#   $var_name or ${var_name}

num1=10
num2=20

echo "num1 : $num1 and num2 : $num2"
# Output: num1 : 10 and num2 : 20

pi=3.14
echo "PI : $pi"

str=SUNBEAM
echo "str : $str"

ch=A
echo "ch : $ch"

# Important points:
# 1. No data type declaration is required in Bash.
# 2. No spaces are allowed around the = sign during assignment.
#    Example: num1=10 (Correct), num1 = 10 (Incorrect)
# 3. Use $ before a variable name to access its value.
#    Example: echo "$num1"
# 4. Semicolons are optional when each command is written
#    on a separate line.
# 5. Quotes are useful when displaying variable values,
#    especially when the value contains spaces.
# 6. Bash variables are not strictly typed. Values are
#    generally stored as strings, and arithmetic can be
#    performed using Bash arithmetic expansion.