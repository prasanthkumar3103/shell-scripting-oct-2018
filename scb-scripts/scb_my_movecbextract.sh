#!/usr/bin/ksh
########################################################################################
# Program ID      : scb_runsftpnt.sh
#
# Function        : Script to send outgoing file to NT using Secure ftp
#
# Program History :
#
# Date       Amended By           Changes/Remarks
# ========   ================     ===============
# 20061206   Geetha Krishnan      New Program 
# 20080226   Ragavendra Dinesh    Changed for HKONG PAS2 Extract
# 20081008   Rosalyn sharmeela    Changed for JSEA PAS2 and B&CPR Extract  
# 20090210   Rosalyn sharmeela    Changed for PABATA PAS2 and B&CPR Extract
# 20090827   Rosalyn sharmeela    Changed for NASA PAS2 and B&CPR Extract  
# 20100325   Rosalyn sharmeela    Changed for UKEA B&CPR Extract 
########################################################################################


########################################################################################
# Function to display the error and usage
########################################################################################
display_error_usage()
{
PARM=$1
echo "Error: $PARM was not specified"
echo "Usage: `basename $0` FILENAME ODATE"
exit 1
}


########################################################################################
# To check the parameter 
########################################################################################
if [ "$1" = "" ]; then
   display_error_usage FILENAME
fi
FILENAME=$1

if [ "$2" = "" ]; then
   display_error_usage "ORDER DATE"
fi
ODATE=$2


########################################################################################
# To get the other parameters
########################################################################################
TARGETDIR=/prd/psftp/gbl/psbatch/outgoing
REMOTEHOST=10.20.210.237
USERID=psbatch
CDTRANSFER=/prd/psftp/gbl/psbatch/outgoing
export TARGETDIR REMOTEHOST USERID CDTRANSFER

DATE_FMT=%ddmmyyyy%

echo $FILENAME | grep $DATE_FMT >/dev/null
if [ $? = 0 ]; then
  ODATE_DD=`echo $ODATE | cut -c7-8`
  ODATE_MM=`echo $ODATE | cut -c5-6`
  ODATE_YYYY=`echo $ODATE | cut -c1-4`
  NEW_ODATE=$ODATE_DD$ODATE_MM$ODATE_YYYY
  FILENAME=`echo $FILENAME | sed "s/$DATE_FMT/$NEW_ODATE/g"`
  echo Translated Filename - $FILENAME
fi

########################################################################################
# To execute the ftp 
########################################################################################
cd $CDTRANSFER 
i#/usr/bin/scp -P 22 $FILENAME  $USERID@$REMOTEHOST:$TARGETDIR/$FILENAME

#mv $FILENAME1 $FILENAME1.Z

mv $FILENAME $NASOUTPATH

if [ $? = 0 ]; then
   echo "\n$FILENAME file was transferred successfully....."
   STATUS=0
   #changes made for archiving the files from  the incoming folders 
else
   echo "\n$FILENAME file transfer failed....."
   STATUS=1
fi

# rm -f $TMPLOG
exit $STATUS

