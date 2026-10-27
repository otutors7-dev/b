#!/bin/bash

# Title     : Count Directory Entries
# Objective : To display directory entries using a for loop
#             and count them.

i=0

# Read entries from the current directory
for var in `ls`
do
	# Display entry number and name
	echo "$i : $var"

	# Increment the counter
	i=`expr "$i" + 1`
done

echo "Entry Count : $i"