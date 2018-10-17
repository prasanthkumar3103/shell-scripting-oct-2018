#!/bin/sh

a=10
b=20

echo "value 1 is $a"
echo "value 2 is $b"

if [ $a == $b ]
then
   echo "a is equal to b"
fi

if [ $a != $b ]
then
   echo "a is not equal to b"
fi
