#!/usr/bin/ksh
################################################################################
# Program ID      : scb_isisft.sh
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
echo "test1"
echo $FILENAME

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


ISISFILE=`cat $HOME/$PASSWDFILEFTP | grep "$FILENAME" | awk '{print $1}'`
ISISKEY=`cat $HOME/$PASSWDFILEFTP | grep "$FILENAME"| awk '{print $2}'`
ISISUSR=`cat $HOME/$PASSWDFILEFTP | grep "$FILENAME" | awk '{print $3}'`
SOUPAT=`cat $HOME/$PASSWDFILEFTP | grep "$FILENAME" | awk '{print $4}'`
DESTPAT=`cat $HOME/$PASSWDFILEFTP | grep "$FILENAME" | awk '{print $5}'`

CHK_NO=`ls -ltr $SOUPAT/$FILENAME | wc -l`
if [ $CHK_NO -gt 0 ]; then
   if [ -f $SOUPAT/$FILENAME ]; then
cd $SOUPAT
export FILENAME1=`ls -ltr $FILENAME| awk '{print $9}'`
echo $FILENAME1
fi
fi
#######################################################################################
# To move the isis par file
#######################################################################################

x=`date +"%F"`
odate=`date +"%S"`
b=$1
echo "-s $ISISKEY"  > /tmp/$ISISFILE.input.$odate
echo "-i $SOUPAT/$FILENAME1" >>  /tmp/$ISISFILE.input.$odate
echo "-o $DESTPAT/$FILENAME1"  >> /tmp/$ISISFILE.input.$odate
echo "-u $ISISUSR"  >> /tmp/$ISISFILE.input.$odate
echo "-end"  >> /tmp/$ISISFILE.input.$odate



########################################################################################
# To execute the isis
########################################################################################
cd $SOUPAT
/prd/isis/hk/bin/isisftrqc HKGFN1P1 < /tmp/$ISISFILE.input.$odate
if [ $? = 0 ]; then
   echo "\nFILE file was transferred successfully....."
   STATUS=0
rm -rf /tmp/$ISISFILE.input.$odate
sleep 180
#rm -rf $ISISFILE
  cd /prd/psftp/gbl/psbatch/archive
  mkdir $x
  cd $SOUPAT
  mv $ISISFILE /prd/psftp/gbl/psbatch/archive/$x/
else
   echo "\nFILE file transfer failed....."
rm -rf /tmp/$ISISFILE.input.$odate
   STATUS=1
fi
exit $STATUS
