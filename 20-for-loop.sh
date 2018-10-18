#!/bin/bash
# basic "for" command

for test in Albama Alaska Arizona california colordo canada
do
   echo "The next state is $test"
done

echo " The last visited state is $test"

test1="belgium"

echo "Wait...! Next you gonna visit place/country/state is $test1"


#Note:

#1.each time for command iterates through the list of values provided
#2.it assigns the $test variable next value in the list
#3.The $test variable can be used just like any other script variable within the for command statement
#4.after the last itertation the $test variable remains the remainder of the shell script.


