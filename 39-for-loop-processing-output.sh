#!/bin/bash
# redirecting the for output to a file

for file in /home/centos/*
 do
   if [ -d "$file" ]
   then
      echo "$file is a directory"
   else
      echo "$file is file"
   fi
done > output.txt
