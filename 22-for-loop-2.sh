#!/bin/bash
# using variable to hold the list

list="ALBAMA ALASKA ARIZONA ARKANAS COLORDO"
list=$list" MELBOURNE "

for test in $list
do
   echo "HAVE YOU EVER BEEN TO $test?"
done
