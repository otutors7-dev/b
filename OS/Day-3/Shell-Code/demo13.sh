#!/bin/bash

# Title     : Check Path and Permissions
# Objective : To check whether a path exists, identify its
#             type, and display its RWX permissions.

# man test
#   -e path : Check whether the path exists
#   -f path : Check whether the path is a regular file
#   -d path : Check whether the path is a directory
#   -r path : Check whether the path is readable
#   -w path : Check whether the path is writable
#   -x path : Check whether the path is executable

# man stat
#   stat -c %A path : Display RWX permissions
#   stat -c %a path : Display numeric permissions
#   stat -c %n path : Display the path name
#   stat -c %F path : Display the file type
#   stat -c %s path : Display the file size
#   stat -c %y path : Display the last modification time
#   stat -c %i path : Display the inode number

echo -n "Enter the path : "
read -r path

# Check whether the path exists
if [ -e "$path" ]
then
	echo "Path exists"

	if [ -d "$path" ]
	then
		echo "Directory path"
		type=`stat -c %F  "$path"`
		echo "Type       : $type"

	elif [ -f "$path" ]
	then
		perm=`stat -c %A  "$path"`
		echo "Permissions: $perm"
		echo "Regular file path"

	else
		echo "Other type of file path"
		# Display file type and permissions
		
	fi
	

else
	echo "Path does not exist"
fi