#!/bin/bash
#check if eithera directory or file exist

location=$HOME
file="file.txt"

if [ -e $location ]
then #directory doesnt exist
    echo "Ok on the $location directory"
    echo "Now checking on the file, $file"

    if [ -e $location/$file ]	
    then
        echo "ok on the file"
        echo "Updating current date..."
        date >> $location/$file
    else
        echo "directory doesnt exist"
        echo "nothing to update in as file doesnt exist in dir:" $location/$file
    fi
else
     echo "directory doesnt exist"
     echo "directory doesnt exist"
fi
