#!/bin/bash
# Testing elif


if [ -f /opt/prashanth/scripts-practice/14-if-example.sh ]
then
   echo "file exist"

elif [ -f /opt/prashanth/scripts-practice/if-example.sh ]
then
   echo "if-example.sh file exist"
else
   echo "files doesnt exit"

fi
   
