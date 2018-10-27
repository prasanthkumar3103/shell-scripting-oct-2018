#!/bin/bash
#testing nested if

testuser=$1

if grep $testuser /etc/passwd
then
   echo "the $testuser exist on this system"
else
   echo "the $testuser doesnt exist on this system"

   if ls -R /home/$testuser/
   then
       echo "however, $testuser has directory"
   fi
fi




if [ ! -e  /home/$test_user ]
    then
        mkdir /home/$test_user
    elif [ ! -e  /home/test_user ]
    then
        echo "/home/$test_user directory already exist"
fi


