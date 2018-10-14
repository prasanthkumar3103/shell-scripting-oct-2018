#!/bin/bash
# trying to write a file to a directory or before you try o change to directory location


jump_dir="$1"
#jump_dir=/opt/prashanth

if [ -d $jump_dir ]
then
   echo "The $jump_dir directory exist"
   cd $jump_dir;echo "Switched to $jump_dir"; echo "listing file inside $jump_dir";ls -R
else
   echo "The $jump_dir directory doesnt exist,kindly specify valid directory"
fi
