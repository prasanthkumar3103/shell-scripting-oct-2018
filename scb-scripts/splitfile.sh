###################################################################################
#Owner: Hexaware Technologies 
#Created date : Tue Aug  8 2006
#This script  will  split the input  file  into  two files , with the  subscripts _CTL and _DTL
#Filename_CTL.txt  will contains  the  1st line of the input 
# file and Filename_DTL  contains the 2nd to Last line  of the  file .
#Implementation steps: sh splitfile.sh splitfile.txt 
####################################################################################
#/bin/bash
scriptName=`basename $1`
if [ $# -ne 1 ]
then
   echo " Usage: $scriptName Flatfilename"

  exit 1
fi
file=$1
var1=` echo "$1"_CTL.txt`
var2=` echo "$1"_DTL.txt`
#var1=` echo "$1" | sed -e 's/_CTL.txt/'`
#var2=` echo "$1" | sed -e 's/_DTL.txt/'`
head -1 $1 > $var1
tail -n +2 $1 > $var2
