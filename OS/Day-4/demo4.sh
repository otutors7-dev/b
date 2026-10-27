#!/bin/Bash

# Menu-driven Code For Basic Calculator

ch=1
while [ $ch -ne 0 ]
do
    echo "Enter 1 for Addition"
    echo "Enter 2 for Subtraction"
    echo "Enter 3 for Multiplication"
    echo "Enter 4 for Division"
    echo "Enter 0 to Exit"
    read ch
    case $ch in
        0) echo "Exiting..."
           ;;
        1) echo "Enter two numbers"
           read a b
           res=`expr $a + $b`
           echo "Sum = $res"
           ;;
        2) echo "Enter two numbers"
           read a b
           res=`expr $a - $b`
           echo "Difference = $res"
           ;;
        3) echo "Enter two numbers"
           read a b
           res=`expr $a \* $b`
           echo "Product = $res"
           ;;
        4) echo "Enter two numbers"
           read a b
           if [ $b -ne 0 ]; then
               res=`expr $a / $b`
               echo "Quotient = $res"
           else
               echo "Division by zero is not allowed."
           fi
           ;;
        
        *) echo "Invalid choice. Please try again."
           ;;
    esac
done