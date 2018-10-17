#!/usr/bin/ksh
########################################################################################
# Program ID      : scb_check_date.sh
#
# Function        : To scan the incoming directory to check if the file date=odate
#
# Program History :
#
# Date       Amended By              Changes/Remarks
# ========   =====================   ===============
# 20071005   Harikumar Kulasekaran   New Program
# 20080312   Ragavendra Dinesh       Modified for MESA
#
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
INDIR=/prd/psftp/gbl/psbatch/incoming

if [ "$1" = "" ]; then
   display_error_usage FILENAME
fi
FILENAME=$1

if [ "$2" = "" ]; then
   display_error_usage ODATE
fi
ODATE=$2

YYYY=`echo $ODATE | cut -c1-4`
MM=`echo $ODATE | cut -c5-6`
DD=`echo $ODATE | cut -c7-8`

ODATE=$DD$MM$YYYY
ODATE2=$YYYY-$MM-$DD

########################################################################################
# Main Process
########################################################################################

#cd $INDIR
#CHK_DIR=`ls $FILENAME | wc -l`
#cd ..
set wrapmargin=10
CHK_DIR=1

PSFTPPARMFILE=.mysg_psftpparmfile
echo $PARMLINE

if [ $CHK_DIR -gt 0 ]; then
   if [ -f $HOME/$PSFTPPARMFILE ]; then
      PARMLINE=`cat $HOME/$PSFTPPARMFILE | grep $FILENAME`
      echo $PARMLINE
       if [ "$PARMLINE" = "" ]; then
              TEMP1=" B"
              TEMP2=" B"
              TEMP3=" B"
              #PARMLINE=$FILENAME$TEMP1$TEMP2$TEMP3
       fi

#added by ramu for MYS GT
       if test $FILENAME = "MYS_RLS_FTP_BAL"
       then
       ch=`cat $INDIR/$FILENAME | head -1  | awk -F'","' '{print $4 }'`
       echo $ch
         if [ "$ch" = "$ODATE" ];
         then
               echo "\n\n$FILENAME has been validated for success \n"
               dos2unix $INDIR/$FILENAME
               exit 0
         else
               echo "\n\n$FILENAME date is not equal to process date \n"
               echo "Please get the revised file from the TP system\n"
               exit 1
         fi
        fi
#added by Rajasekar for MYS IMGC-OPX
       if test $FILENAME = "MYS_OPI_FTP_BAL" || test $FILENAME = "MYS_ACB_FTP_BAL" || test $FILENAME = "MYS_BBS_FTP_BAL"
       then
       ch=`cat $INDIR/$FILENAME | head -1  | awk -F'","' '{print $4 }'`
       echo $ch
         if [ "$ch" = "$ODATE" ];
         then
               echo "\n\n$FILENAME has been validated for success \n"
               dos2unix $INDIR/$FILENAME
               exit 0
         else
               echo "\n\n$FILENAME date is not equal to process date \n"
               echo "Please get the revised file from the TP system\n"
               exit 1
         fi
        fi
       if [ "$PARMLINE" != "" ]; then
         STARTPOS=`echo $PARMLINE | awk '{print $2}'`
         ENDPOS=`echo $PARMLINE | awk '{print $3}'`
         HEADORTAIL=`echo $PARMLINE | awk '{print $4}'`
         if [ "$HEADORTAIL" != "B" ]; then
            FILEPRCSDT=`cat $INDIR/$FILENAME | $HEADORTAIL -1 | cut -c$STARTPOS-$ENDPOS`
            if [ "$FILEPRCSDT" = "$ODATE" ]; then
               echo "\n\n$FILENAME has been validated for success \n"
               dos2unix $INDIR/$FILENAME
               exit 0
            else
               echo "\n\n$FILENAME date is not equal to process date \n"
               echo "Please get the revised file from the TP system\n"
               exit 1
            fi
         else
           echo formated date $ODATE2
           echo File Name: $INDIR/$FILENAME
           # `cat $INDIR/$FILENAME | head  -1 | grep -i $ODATE2 | wc -l`
           cat $INDIR/$FILENAME | head  -1 > hddata
           cat hddata | grep $ODATE2 > outhd
           # cat $INDIR/$FILENAME | head  -1 > hddata
            if [ $? != 1 ]; then
               echo "\n\n$FILENAME - Header has been validated for success \n"
               dos2unix $INDIR/$FILENAME
               #`cat $INDIR/$FILENAME | tail  -1 | grep -i $ODATE2 | wc -l`
               cat $INDIR/$FILENAME  | tail  -1 | grep -i $ODATE2 > outtl
               if [ $? != 1 ]; then
                  echo "\n\n$FILENAME - Tail has been validated for success \n"
                  dos2unix $INDIR/$FILENAME
                  exit 0
               else
                  echo "Please get the revised file from the TP system - tail date - Tail is mismatch\n"
                  echo "Please get the revised file from the TP system\n"
                  exit 1
               fi
            else
               echo "Please get the revised file from the TP system - header date - Tail is mismatch\n"
               echo "Please get the revised file from the TP system\n"
               exit 1
            fi
         fi
      else
         echo "\n\nERROR: $FILENAME is not available in $PSFTPPARMFILE \n"
         exit 1
      fi
   else
      echo "\n\nERROR: PSFTPPARMFILE - $PSFTPPARMFILE is not available \n"
      exit 1
   fi
else
   echo "\n\nERROR: $FILENAME is not available in $INDIR \n"
   exit 1
fi
