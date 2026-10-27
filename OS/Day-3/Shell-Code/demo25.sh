#!/bin/bash

# write a script to install gcc vim cal
# store all appl in array and use loop to install one by one


sudo apt update -y    # First: Update package lists
sudo apt upgrade -y   # Then: Upgrade installed packages

# array of applications to be installed
appl=(gcc vim cal git xyz)

# loop to install applications one by one
for i in ${appl[@]}
do
    sudo yum install -y $i
    if [  $? -eq 0 ]            # $? is exit status of last executed command
    then
        echo "$i installed successfully" # $? = 0 means success
    else
        echo "$i installation failed"    # $? != 0 means failure
    fi
done