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
# 20080314   Rajasekar            Modified code for BSMT - PG584 to PG590
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


########################################################################################
# To get the other parameters
########################################################################################

TARGETDIR=/prd/psftp/gbl/psbatch/outgoing
REMOTEHOST=10.20.210.237
USERID=psbatch
CDTRANSFER=/prd/psftp/gbl/psbatch/outgoing
export TARGETDIR REMOTEHOST USERID CDTRANSFER


########################################################################################
# To execute the ftp
########################################################################################
cd $CDTRANSFER
export FILENAME1=`ls -ltr $FILENAME| awk '{print $9}'`
/prd/psftp/ftpadm/compress $FILENAME1
#/usr/bin/scp -P 22 $FILENAME1.Z  $USERID@$REMOTEHOST:$TARGETDIR/$FILENAME1.Z

#mv $FILENAME1 $FILENAME1.Z

mv $FILENAME1.Z $NASOUTPATH

if [ $? = 0 ]; then
   echo "\n$FILENAME1 file was transferred successfully....."
rm -f $FILENAME1.gz
STATUS=0
   #changes made for archiving the files from  the incoming folders
else
   echo "\n$FILENAME1 file transfer failed....."
   STATUS=1
fi

rm -f $TMPLOG
exit $STATUS
