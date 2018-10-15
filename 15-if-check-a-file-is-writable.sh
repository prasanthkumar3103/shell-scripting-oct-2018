#!/bin/bash
# check if a file is writable

filename=/opt/prashanth/scripts-practice/data.txt

if [ -f $filename ]
then
    if [ -w $filename ]
    then
        echo "file is writable and writting current time and some content"
        date +%m%d%y >>$filename
    else
        echo "$filename, file is not writable"
    fi
else
    echo "file doesnt exist"
fi
