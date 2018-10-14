#!/bin/bash

# check if either a directory or a file exists

dir-name=/opt/prashanth

echo "The dir-name being checked:$dir-name"

if [ -e $dir-name ]
then #checking condition for dir
    echo "The dir-name,$dir-name, doesnt exist,but is it a file?"

    if [ -f $dir-name ]
    then #checking condition for file
	echo "Yes,$dir-name is a file"
    else # item is not file
	echo "No,$dir-name is not a file"
    fi

else #item doesnt exist
    echo "$dir-name doesnt exist"
    echo "noting to update...!"
fi

