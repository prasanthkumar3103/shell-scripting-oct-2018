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


#!/bin/bash

file_path=/opt/prashanth/one.txt

if [ -f $file_path ]
then
    echo "$file_path file is exist and checking for empty or non-empty file"

    if [ -s $file_path ]
    then
        echo "file is not empty it will display data else no"
        echo "displaying file data `cat $file_path`"
    else
        echo " file $file_path doesnt exist in fs or file is not having data"
    fi
else
    echo "$file_path invalid directory"
fi
