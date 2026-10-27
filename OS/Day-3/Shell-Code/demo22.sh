#!/bin/bash

# Title     : Positional Parameters in Bash
# Objective : To access and display command-line arguments
#             passed to a shell script.

# Positional parameters are similar to command-line
# arguments in C.

# Example:
#   ./demo22.sh one two three four

# To access positional parameters:
#   $1, $2, $3, ... -> Individual arguments
#   $0              -> Script name
#   $*              -> All positional parameters
#   $#              -> Number of positional parameters

# Run this script:
#   bash demo22.sh 10 20 30 40
#   bash demo22.sh one two three four five six seven eight nine ten

echo "Name : $0"
echo "Parm1 : $1"
echo "Parm2 : $2"
echo "Parm3 : $3"
echo "Parm4 : $4"

# Display all positional parameters
echo "All Parm : $*"

# Display the number of positional parameters
echo "Count of Parm : $#"

#-------------------------------------

# Access each positional parameter one by one
for var in "$@"
do
	echo "var : $var"
done