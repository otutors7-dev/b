#!/bin/bash

# Title     : Display Number of Days in a Month
# Objective : To demonstrate the case statement in Bash.

# case statement syntax:
#
# case variable in
#     pattern1 | pattern2)   <-- case patterns can be combined using |
#         code               <-- code to execute if pattern matches
#         ;;                 <-- break
#     pattern3)
#         code
#         ;;
#     *)					<-- * default case if no patterns match
#         default code      <-- code to execute if no patterns match
#         ;;                <-- break
# esac                      <-- end of case statement

# Accept the month from the user
echo -n "Enter the Month : "
read month

# Convert the input to uppercase
month=`echo "$month" | tr 'a-z' 'A-Z'

# Check the month using the case statement
case "$month" in
	1|JAN|JANUARY)
		echo "January has 31 days."
		;;

	2|FEB|FEBRUARY)
		echo "February has 28/29 days."
		;;

	3|MAR|MARCH)
		echo "March has 31 days."
		;;

	4|APR|APRIL)
		echo "April has 30 days."
		;;

	5|MAY)
		echo "May has 31 days."
		;;

	6|JUN|JUNE)
		echo "June has 30 days."
		;;

	7|JUL|JULY)
		echo "July has 31 days."
		;;

	8|AUG|AUGUST)
		echo "August has 31 days."
		;;

	9|SEP|SEPTEMBER)
		echo "September has 30 days."
		;;

	10|OCT|OCTOBER)
		echo "October has 31 days."
		;;

	11|NOV|NOVEMBER)
		echo "November has 30 days."
		;;

	12|DEC|DECEMBER)
		echo "December has 31 days."
		;;

	*)
		echo "Invalid Month."
		;;
esac