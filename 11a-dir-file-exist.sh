#!/bin/bash


dir_loc=$1
filename=$2

if [ -e $dir_loc ]
then
    echo " $dir_loc directory exist and moving to next"
     if [ ! -e $dir_loc ]
     then
         mkdir $dir_loc

    elif [ ! -e $dir_loc/$filename ]
    then
         touch $dir_loc/$filename
         date +%Y%m%d >>$dir_loc/$filename
    elif  [ -e $dir_loc/$filename ]
     then
         echo "$filename file exist in $dir_loc directory and appending some data to file"
         date +%Y%m%d >>$dir_loc/$filename
     fi
else
    echo "$dir_loc directory is not present ,Please create file system"
fi
