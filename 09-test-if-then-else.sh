#!/bin/bash
#Testing the test command

myvar=""

if test $myvar
then
    echo "variable is empty and condition is true"
else
    echo "variable has empty & condition is true and fell in else block"
fi

