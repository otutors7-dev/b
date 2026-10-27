#!/bin/bash

# Title     : Escape Sequences in Bash
# Objective : To demonstrate escape sequences using echo -e.

# Escape sequences:
#   \n  => Newline
#   \t  => Horizontal tab
#   \b  => Backspace
#   \r  => Carriage return
#   ... => Other escape sequences

# Use echo -e to interpret/enable escape sequences

echo -e "Hello DAC \n Good Morning"
echo -e "Helloo\bWorld"
echo -e "DAC\tDMC"
echo -e "DAC123\rDMC"