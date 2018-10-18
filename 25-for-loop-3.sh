#!/bin/bash

# reading values from a file


file="states"

IFS=$'\n'

# if you've multiple IFS character,do specify like below.

#IFS=$'\n':;"  # new line,colon,semicolon,and double quotes

# adding IFS ='\n\t\s' to script tells the bash shell t ignore space and spaces and tabs in data values.

for test in $(cat $file)
do
  echo "Visit beautiful place $test"
done 
