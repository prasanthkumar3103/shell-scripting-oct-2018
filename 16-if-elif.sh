#!/bin/bash
# Testing elif


if [ -f /opt/prashanth/scripts-practice/14-if-example.sh ]
then
   echo "file exist"

elif [ -f /opt/prashanth/scripts-practice/if-example.sh ]
then
   echo "if-example.sh file exist"
else
   echo "files doesnt exit"

fi
   

#!/bin/bash

arg1=$1
arg2=$2
arg3=$3

if [ "$arg1" = "$arg2" ] && [ "$arg1" != "$arg3" ]
then
    echo "two of the provided are equal $arg1 $arg2 $arg3"
elif [ $arg1 = $arg2 ] && [ $arg1 = $arg3 ] && [ $arg2 = $arg3 ]
then
    echo "ALL OF THE SPECIFIED ARGS ARE EQUAL $arg1 $arg2 $arg3"
else
    echo "All of the specified args are different $arg1 $arg2 $arg3"
fi
~
