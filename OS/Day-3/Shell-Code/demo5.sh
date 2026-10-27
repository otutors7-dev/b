#!/bin/bash

# Title     : Accepting User Input using read
# Objective : To accept numbers and a string from the user
#             and display the entered values.


# Accept two num and print the values of number
# to accept value from end user use read command
# syntax
    # read var_name               # it will accept single value
    # read var1 var2 var3 ...     # it will accept multiple values
    # read -p "message" var_name  # it will print message and accept value
    # read -n num var_name        # it will accept only num characters



# Accept the first value
echo "Enter num1 value : "
read num1

# Accept the second value
echo "Enter num2 value : "
read num2

# Display the entered values
echo "values : $num1 , $num2"

# Accept a string from the user
echo "Enter str : "
read str

# Display the entered string
echo "str : $str"

#----------------------------------