#!/usr/bin/ksh
########################################################################################
# Program ID      : scb_ctmfw.sh
#
# Function        : Control-M File Watcher
#
# Program History :
#
# Date       Amended By           Changes/Remarks
# ========   ================     ===============
# 20020906   Edelmiro Magadia     New Program
# 20021106   Edelmiro Magadia     To remove the ^Z char in the SGP_FAS.TXT file 
# 20030530   Edelmiro Magadia     Checking for SGP_FAS.txt file has been removed
# 25092007   S. EUJISH            Changed Default Values
# 06022009   R.A.Ramu             Modified to convert dos2unix and capture file timings  
########################################################################################
 

########################################################################################
# To check the parameter 
########################################################################################
if [ "$1" = "" ]; then
   echo "Error: Interface filename was not specified"
   echo "Usage: `basename $0` FILENAME"
   exit 1
fi
FILENAME=$1
ODATE=$2

########################################################################################
# To assign the default value
########################################################################################
MIN_SIZE=0
#SLEEP_INT=15
SLEEP_INT=30
#SLEEP_INT=1
MON_INT=30
#MON_INT=15
#MON_INT=60
#MIN_DETECT=3
MIN_DETECT=3
WAIT_TIME=0


########################################################################################
# To check if parameter is specified, if specified use the parameter instead of default
########################################################################################
if [ "$2" != "" ]; then
   MIN_SIZE=$2
fi

if [ "$3" != "" ]; then
   SLEEP_INT=$3
fi

if [ "$4" != "" ]; then
   MON_INT=$4
fi

if [ "$5" != "" ]; then
   MIN_DETECT=$5
fi

if [ "$6" != "" ]; then
   WAIT_TIME=$6
fi

if [ "$FILENAME" = "MY_TPREC_COA" ]; then
   FILENAME="MYSIA_TPREC_COA"
fi

if [ "$FILENAME" = "MY_TPREC_COADTL" ]; then
   FILENAME="MYSIA_TPREC_COADTL"
fi

if [ "$FILENAME" = "SG_TPREC_COA" ]; then
   FILENAME="SPORE_TPREC_COA"
fi

if [ "$FILENAME" = "SG_TPREC_COADTL" ]; then
   FILENAME="SPORE_TPREC_COADTL"
fi

echo $FILENAME


########################################################################################
# To execute the Control-m file watcher program 
########################################################################################
ctmfw $INDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
cd $INDIR
mv $FILENAME /prd/psftp/gbl/psbatch/incoming
cd /prd/psftp/gbl/psbatch/incoming
ls -ltr $FILENAME >> filestats.lst
#ls -lrt $FILENAME --time-style=long-iso | awk '{print $6 , $7 , $8 }' >> filetimings.csv
#cat "filetimings.csv" | while read LINE
#do
#if [ "$LINE"  != "" ]; then
#
#awk '{print $1,",",$2,",",$3,",","incoming",","}'>> $PSBATCH_HOME/incoming/Filetimings_$1.csv
#fi
#done
#compress *.*
#uncompress Filetimings_$1.csv
#rm filetimings.csv.Z

#sed "s/$/$var_dat/" Filetimings_$1.csv >output_$ODATE.csv
#cp output_$ODATE.csv $PSBATCH_HOME/outgoing
dos2unix $FILENAME
