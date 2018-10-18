#!/bin/bash
# iterate through all the files in a directory

for file in /home/centos/*
do
   if [ -d $file ]
   then
      echo "$file is a directory"
   elif [ -f $file ]
   then
       echo "$file is a file"
   else
       echo "$file doesnt exist" # this statement else is optional
   fi
done

