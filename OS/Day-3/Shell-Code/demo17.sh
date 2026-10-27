#!/bin/bash

# Title     : Print Star Pattern
# Objective : To print a right-aligned star pattern using
#             nested while loops.

# Pattern:
#    *
#   * *
#  * * *
# * * * *

row=4
i=1

# Outer loop controls the rows
while [ "$i" -le "$row" ]
do
	# Print spaces before the stars
	j=1
	while [ "$j" -le "$(expr "$row" - "$i")" ]
	do
		echo -n " "
		j=`expr "$j" + 1`
	done

	# Print stars in the current row
	k=1
	while [ "$k" -le "$i" ]
	do
		echo -n "* "
		k=`expr "$k" + 1`
	done

	# Move to the next line
	echo ""

	# Increment the row number
	i=`expr "$i" + 1`
done