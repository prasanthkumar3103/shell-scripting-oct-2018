#!/bin/bash
#Testing while loop

var1=10

while [ $var1 -gt 0 ]
do
  echo $var1
  echo "This is inside the loop"
  var1=$[ var1 -1 ]
done
