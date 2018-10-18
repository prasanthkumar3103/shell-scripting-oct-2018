#!/bin/bash

# read input from file

file="states"

for state in $(cat $file) # file name stored in file variable and accessing
do
   echo "Visit beautiful $state"
done
