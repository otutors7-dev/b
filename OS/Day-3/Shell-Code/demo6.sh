#!/bin/bash

# Title     : Reading User Input in Bash
# Objective : To accept input using read, read -p, and echo -n.

# -n : Display the prompt without moving to the next line
echo -n "Enter num : "
read num1
echo "num1 : $num1"

# -------------------------------------------

# Accept three values in a single read statement
# Values entered with spaces are stored in separate variables
echo -n "Enter 3 values : "
read n1 n2 n3
echo "$n1 $n2 $n3"

# -------------------------------------------

# -p : Display the prompt directly using read
read -p "Enter the num : " num2
echo "num2 : $num2"