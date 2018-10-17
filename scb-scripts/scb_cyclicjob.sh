#!/usr/bin/ksh
########################################################################################
# Program ID      : scb_etl_scanfile.sh 
#
# Function        : To scan the incoming directory and move the files to incoming file 
#                   of ETL server 
#
# Program History :
#
# Date       Amended By              Changes/Remarks
# ========   =====================   ===============
# 20071017   Harikumar Kulasekaran   New Program
# 20071030   Eujish                  ODATE Changed
# 
########################################################################################

########################################################################################
# Function to display the error and usage
########################################################################################
display_error_usage()
{
PARM=$1
echo "Error: $PARM was not specified"
echo "Usage: `basename $0` ODATE"
exit 1
}


########################################################################################
# To check the parameter
########################################################################################
#if [ "$1" = "" ]; then
#   display_error_usage ODATE
#fi
ODATE=$1
COUNTRY_CODE=$2


########################################################################################
# To assign the default value for file watcher
########################################################################################
MIN_SIZE=0
SLEEP_INT=1
MON_INT=15
MIN_DETECT=4
WAIT_TIME=5


########################################################################################
# To check the incoming file 
########################################################################################

cd $PSFTPINDIR

ls UK_EOD_RATES IN_EOD_RATES SG_EOD_RATES | while read FILENAME
do 
   if [ "$FILENAME" = "UK_EOD_RATES" ]; then
      cp -p $FILENAME MY_UK_EOD_RATES
      cp -p $FILENAME HK_UK_EOD_RATES
   else
      if [ "$FILENAME" = "IN_EOD_RATES" ]; then
         cp -p $FILENAME MY_IN_EOD_RATES
         cp -p $FILENAME HK_IN_EOD_RATES
      else
         if [ "$FILENAME" = "SG_EOD_RATES" ]; then
            cp -p $FILENAME MY_SG_EOD_RATES
            cp -p $FILENAME HK_SG_EOD_RATES
         fi
      fi
   fi
done

CHK_DIR=`ls $COUNTRY_CODE* | wc -l`

if [ $CHK_DIR -gt 0 ]; then
   ls $COUNTRY_CODE* | while read FILENAME
   do
      if [ $? = 0 ]; then 
         ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
         if [ $? = 0 ]; then 
            if [ "$COUNTRY_CODE" = "MY" ] ||  [ "$COUNTRY_CODE" = "SG" ]; then
                   REMOTEHOST=PG586
            else
               if  [ "$COUNTRY_CODE" = "HK" ]; then
                   REMOTEHOST=10.20.210.24
               else
                   echo "$COUNTRY_CODE is not configured"
                   exit 1
               fi
            fi
            TARGETDIR=/prd/psftp/gbl/psbatch/incoming 
            USERID=psbatch 
            CDTRANSFER=/prd/psftp/gbl/psbatch/incoming 
            export TARGETDIR REMOTEHOST USERID CDTRANSFER 
            echo "\nFile transfer started for the file $FILENAME ....." 
            if [ "$FILENAME" = "MY_UK_EOD_RATES" ]; then
                /usr/bin/scp -P 22 $PSFTPINDIR/$FILENAME $USERID@$REMOTEHOST:$TARGETDIR/UK_EOD_RATES
            else
               if [ "$FILENAME" = "HK_UK_EOD_RATES" ]; then
                  /usr/bin/scp -P 22 $PSFTPINDIR/$FILENAME $USERID@$REMOTEHOST:$TARGETDIR/UK_EOD_RATES
               else
                  if [ "$FILENAME" = "MY_IN_EOD_RATES" ]; then
                     /usr/bin/scp -P 22 $PSFTPINDIR/$FILENAME $USERID@$REMOTEHOST:$TARGETDIR/IN_EOD_RATES
                  else
                     if [ "$FILENAME" = "HK_IN_EOD_RATES" ]; then
                        /usr/bin/scp -P 22 $PSFTPINDIR/$FILENAME $USERID@$REMOTEHOST:$TARGETDIR/IN_EOD_RATES
                     else
                        if [ "$FILENAME" = "MY_SG_EOD_RATES" ]; then
                           /usr/bin/scp -P 22 $PSFTPINDIR/$FILENAME $USERID@$REMOTEHOST:$TARGETDIR/SG_EOD_RATES
                        else
                           if [ "$FILENAME" = "HK_SG_EOD_RATES" ]; then
                              /usr/bin/scp -P 22 $PSFTPINDIR/$FILENAME $USERID@$REMOTEHOST:$TARGETDIR/SG_EOD_RATES
                           else
                              /usr/bin/scp -P 22 $PSFTPINDIR/$FILENAME $USERID@$REMOTEHOST:$TARGETDIR/$FILENAME
                           fi
                        fi
                     fi
                  fi
               fi
            fi
            if [ $? = 0 ]; then 
               echo "\n$FILENAME file was transferred successfully....." 
               ls -ltr $PSFTPINDIR/$FILENAME >> filestats.lst
               ARCHIVEDIR="/prd/psftp/gbl/psbatch/archive"
               cd $ARCHIVEDIR
               if [ ! -d "$ARCHIVEDIR/$ODATE" ]; then
                  mkdir $ARCHIVEDIR/$ODATE 
                  chmod 755 $ARCHIVEDIR/$ODATE 
               fi
               if [ "$FILENAME" != "SG_EOD_RATES" ]; then
               mv $PSFTPINDIR/$FILENAME $ARCHIVEDIR/$ODATE/$FILENAME
               compress -f $ARCHIVEDIR/$ODATE/$FILENAME
               STATUS1=0
               fi
            else
               echo "\n$FILENAME file transfer failed....."
               STATUS2=1
            fi
         else
            # If after 5 minutes and file is still growing 
            echo "$FILENAME will be retained in $PSFTPINDIR directory, will scan again later."
         fi
      fi
   done
   if [ $STATUS2 -eq 1 ]; then
      echo "\nFile transfer failed....."
      exit 1
   fi
else
   echo "No files are available in $PSFTPINDIR directory"
fi


