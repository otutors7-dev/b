#!/bin/bash

# Title     : shift Command in Bash
# Objective : To demonstrate how shift changes positional
#             parameters in a shell script.

# Example:
#   ./demo.sh 11 22 33 44 55 66
#
# Initially:
#   $0  $1  $2  $3  $4  $5  $6
#   |   |   |   |   |   |   |
# demo 11  22  33  44  55  66

# Display the original positional parameters
echo "parm1 : $1"
echo "parm2 : $2"
echo "parm3 : $3"
echo "parm4 : $4"
echo "parm5 : $5"
echo "parm6 : $6"

# Shift positional parameters by 3 positions
shift 3

# After shift 3:
#   $0  $1  $2  $3
#   |   |   |   |
# demo 44  55  66
#
# The first three arguments (11, 22, 33) are removed
# from the positional parameter list.

echo "After shift 3:"
echo "parm1 : $1"
echo "parm2 : $2"
echo "parm3 : $3"
echo "parm4 : $4"
echo "parm5 : $5"
echo "parm6 : $6"