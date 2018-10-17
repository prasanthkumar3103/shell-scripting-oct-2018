#!/usr/bin/ksh
################################################################################
# Program ID      : scb_isis.sh
#
# Function        : Script to send outgoing file using isis
#
# Program History :
#
# Date       Amended By           Changes/Remarks
# ========   ================     ===============
# 20070724   Madhan Mohanam         New Program
#
# Note: In .profile specifie the parameter PASSWDFILE, it should have the filename
#       as the first parameter and the key as the second parameter
#
#
################################################################################


################################################################################
# Function to display the error and usage
################################################################################
display_error_usage()
{
PARM=$1
echo "Error: $PARM was not specified"
echo "Usage: `basename $0` FILENAME "
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

if [ -f $HOME/$PASSWDFILEFTP ]; then
   ISISLINE=`cat $HOME/$PASSWDFILEFTP | grep ^$FILENAME' '`
   echo $ISISLINE
   if [ "$ISISLINE" = "" ]; then
      echo "FILENAME $FILENAME does not exist in $HOME/$PASSWDFILEFTP file"
      exit 1
   fi
else
   echo "$HOME/$PASSWDFILEFTP does not exist....."
   exit 1
fi

ISISFILE=`cat $HOME/$PASSWDFILEFTP | grep "^$FILENAME" | awk '{print $1}'`
ISISKEY=`cat $HOME/$PASSWDFILEFTP | grep "^$FILENAME"| awk '{print $2}'`
ISISUSR=`cat $HOME/$PASSWDFILEFTP | grep "^$FILENAME" | awk '{print $3}'`
SOUPAT=`cat $HOME/$PASSWDFILEFTP | grep "^$FILENAME" | awk '{print $4}'`
DESTPAT=`cat $HOME/$PASSWDFILEFTP | grep "^$FILENAME" | awk '{print $5}'`

#######################################################################################
# To move the isis par file
#######################################################################################

odate=`date +"%S"`
b=$1
echo "-s $ISISKEY"  > /tmp/input.$odate
echo "-i $SOUPAT" >>  /tmp/input.$odate
echo "-o $DESTPAT"  >> /tmp/input.$odate
echo "-u $ISISUSR"  >> /tmp/input.$odate
echo "-end"  >> /tmp/input.$odate



########################################################################################
# To execute the isis
########################################################################################
cd $FTPOUT
/prd/isis/hk/bin/isisftrqc HKGFN1P1 < /tmp/input.$odate

if [ $? = 0 ]; then
   echo "\nFILE file was transferred successfully....."
export DATE_FMT=`date +%a_%b_%d_%y`
   v_archivedir="/prd/psftp/gbl/psbatch/archive"
   v_outgoingdir="outgoing"
   cd $v_archivedir
echo $FILENAME
   #we need to  check  if the folderDATE_FMT exists it will move the  file from the
   if [ -d ./$DATE_FMT ];
   then
	sleep 180
      #mv ../$v_outgoingdir/$FILENAME ./$DATE_FMT/
      mv /prd/finance/psftp/outgoing/$FILENAME /prd/psftp/gbl/psbatch/archive/$DATE_FMT/
      cd /prd/psftp/gbl/psbatch/archive/$DATE_FMT
      gzip $FILENAME
      #code added  for zip
   else
      sleep 80 
      mkdir $DATE_FMT
      #mv ../$v_outgoingdir/$FILENAME ./$DATE_FMT/
      mv /prd/finance/psftp/outgoing/$FILENAME /prd/psftp/gbl/psbatch/archive/$DATE_FMT/
      cd /prd/psftp/gbl/psbatch/archive/$DATE_FMT
      gzip $FILENAME 
   fi
   #end of archive process

   STATUS=0
rm -rf /tmp/input.$odate

else
   echo "\nFILE file transfer failed....."
   STATUS=1
fi
exit $STATUS
