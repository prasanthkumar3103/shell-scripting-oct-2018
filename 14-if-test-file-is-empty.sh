#!/bin/bash
# Testing if a file is empty

file=/opt/prashanth/scripts-practice/data.txt

if [ -f $file ]
then
   #checks file exists and its not empty
   if [ -s $file ]
   then
	echo "The $file file exists and has data in it and displaying content what it has"
	cat $file
   else
	echo "The $file file exists,but it is empty"
   fi
else
    echo "File,$file doesnt exist in system"
fi
