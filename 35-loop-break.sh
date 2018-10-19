#!/bin/bash

# breaking out of a for loop

for var in 1 2 3 4 5 6 7 8 9 10
do
  if [ $var -ge 5 ]
  then
      break
  fi
  echo "Iteration numner is: $var"
done
