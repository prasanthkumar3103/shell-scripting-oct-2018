#!/usr/bin/ksh
########################################################################################
# Program ID      : scb_runopnsh.sh
#
# Function        : Script to send outgoing file to NT using ftp
#
# Program History :
#
# Date       Amended By           Changes/Remarks
# ========   ================     ===============
# 20030206   Edelmiro Magadia     New Program
# 20030521   Edelmiro Magadia     grep the $FILENAME from the beginning of line 
# 20051126   Saravanan Nainar     added sftp component 
# 20060328   Mohamed Ismail	  Made as a global script for all kind of file transfer thro openssh 
#
########################################################################################
#exit 0

########################################################################################
# Function to display the error and usage
########################################################################################
display_error_usage()
{
PARM=$1
echo "Error: $PARM was not specified"
echo "Usage: `basename $0` FILENAME"
exit 1
}
HOME=/prd/psftp/gbl/psbatch1
PASSWDFILE=.gbl_parmfile

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
if [ -f $HOME/$PASSWDFILE ]; then
   FTPNTLINE=`cat $HOME/$PASSWDFILE | grep ^$FILENAME`

   if [ "$FTPNTLINE" = "" ]; then
      echo "\n\nFILENAME $FILENAME does not exist in $HOME/$PASSWDFILE file"
      exit 1
   fi
else
   echo "\n\n$HOME/$PASSWDFILE does not exist....."
   exit 1
fi

TARGETDIR=`echo $FTPNTLINE | awk '{print $2}'`
REMOTEHOST=`echo $FTPNTLINE | awk '{print $3}'`
USERID=`echo $FTPNTLINE | awk '{print $4}'`
PRIVATEKEY=`echo $FTPNTLINE | awk '{print $5}'`
FTPPORT=`echo $FTPNTLINE | awk '{print $6}'`

OUTDIR=/prd/psftp/gbl/psbatch/outgoing


########################################################################################
# To execute the ftp 
########################################################################################
#TMPLOG=$PSBATCHLOG/scb_runopnsh_$FILENAME.log
#
#if [ -f $OUTDIR/$FILENAME ]; then
#   TMPFILES=1
#   ODATE=$2
#   FREQ_DESC="daily"
#   if [ ! -d "$ARCHIVEDIR/$FREQ_DESC" ]; then
#      mkdir $ARCHIVEDIR/$FREQ_DESC
#      chmod 775 $ARCHIVEDIR/$FREQ_DESC
#   fi
#
#   if [ ! -d "$ARCHIVEDIR/$FREQ_DESC/$ODATE" ]; then
#      mkdir $ARCHIVEDIR/$FREQ_DESC/$ODATE
#      chmod 775 $ARCHIVEDIR/$FREQ_DESC/$ODATE
#   fi
#   cp $OUTDIR/$FILENAME $CDTRANSFER
#   mv -f $OUTDIR/$FILENAME $ARCHIVEDIR/$FREQ_DESC/$ODATE
#else
#   TMPFILES=0
#fi
#
#if [ $TMPFILES -eq 0 ]; then
#    echo "NO "$FILENAME" FILE"
#    rm -f $TMPLOG
#    exit 0
#else

cd $OUTDIR 
/usr/bin/scp -P $FTPPORT -i $PRIVATEKEY  $FILENAME  $USERID@$REMOTEHOST:$TARGETDIR/$FILENAME
#cat $TMPLOG | grep "Transfer complete" >/dev/null
if [ $? = 0 ]; then
   echo "\n$FILENAME file was transferred successfully....."
#   rm -f $CDTRANSFER/$FILENAME
   STATUS=0
else
   echo "\n$FILENAME file transfer failed....."
   STATUS=1
fi

exit $STATUS
