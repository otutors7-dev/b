#!/bin/bash

str="sunBEAM"
echo "str : ${str^^}"  # convert into uppercase
echo "str : ${str,,}"  # convert into small case


echo "str : ${str^}"  # convert 1st char into uppercase
echo "str : ${str,}"  # convert 1st char into small case

# find length of string
echo "length of str : ${#str}"

# find and replace
echo "str : ${str/BEAM/tech}"    # replace 1st occurrence
echo "str : ${str//A/E}"         # replace all occurrence

#----------------------------------------


