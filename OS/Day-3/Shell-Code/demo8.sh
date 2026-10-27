#!/bin/bash

# Title     : Area of Circle
# Objective : To calculate the area of a circle using bc.

# To perform arithmetic operations with decimal values, we can use bc.
# Syntax: echo "expression" | bc

# To set the number of digits after the decimal point, use scale.
# Syntax: echo "scale=2; expression" | bc

# $(command) or `command` is used to execute a command
# and store its output in a variable.

# Calculate the area of a circle

echo "Enter radius: "
read rad

# Calculate area using the formula: Area = 3.14 * radius * radius
area=`echo "3.14 * $rad * $rad" | bc`

echo "Area : $area"