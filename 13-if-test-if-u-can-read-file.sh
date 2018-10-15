#!/bin/bash
# testing if user has right permission to read file

file=/etc/shadow

if [ -f /$file ]
then
   if [ -r $file ]
   then 
	echo " user has appropriate access to read file $file & listing some data"
	head -3 $file
   else
   	echo "Sorry.., user doesnt have appropriate accessto read $file"
   fi
else
    echo "$file file doesnt exist in system"
fi
