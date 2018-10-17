#!/usr/bin/ksh
########################################################################################
# Program ID      : scb_cyclicjob_MESA_ebbs.sh
#
# Function        : To UNZIP eBBS related files for MESA
#                   
#
# Program History :
#
# Date       Amended By              Changes/Remarks
# ========   =====================   ===============
# 20080409   Royar Rosalyn sharmeela Rename GLBSETRAN
########################################################################################

########################################################################################
# Function to display the error and usage
########################################################################################
display_error_usage()
{
PARM=$1
PARAM1=$2
echo "Error: $PARM & $PARAM1 was not specified"
echo "Usage: `basename $0` ODATE COUNTRY_CODE"
exit 1
}


########################################################################################
# To check the parameter
########################################################################################
if [ "$1" = "" ]; then

    if [ "$2" = "" ]; then
       display_error_usage ODATE COUNTRY_CODE
    fi
fi

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

PSFTPINDIR=/prd/finance/psftp/incoming
cd $PSFTPINDIR

echo "Directory ----> $PSFTPINDIR"




if [ "$COUNTRY_CODE" = "MY" ] ||  [ "$COUNTRY_CODE" = "SG" ]; then
   echo "$COUNTRY_CODE is Valid."
else
   echo "$COUNTRY_CODE is IN-VALID"
   exit 1
fi


ODATE=$1
COUNTRY_CODE=$2

YYYY=`echo $ODATE | cut -c1-4`
MM=`echo $ODATE | cut -c5-6`
DD=`echo $ODATE | cut -c7-8`

ODATE1=$DD$MM$YYYY

   if [ "$COUNTRY_CODE" = "MY" ]; then
      	ls GLBSETRAN_MYS_$ODATE1.CSV | while read FILENAME	
              do
                    if [ $? = 0 ]; then
                       ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                                                                         
                          if [ "$FILENAME" = "GLBSETRAN_MYS_$ODATE1.CSV" ]; then
			  cp -p $PSFTPINDIR/$FILENAME $PSFTPINDIR/GLBSETRAN_MYS_%ddmmyyyy%.CSV
                 	  mv $PSFTPINDIR/$FILENAME /prd/psftp/gbl/psbatch/archive
   		          fi
   		    fi      
              done
       ls GLBSETRAN_IB_MYS_$ODATE1.CSV | while read FILENAME
              do
                    if [ $? = 0 ]; then
                       ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME

                          if [ "$FILENAME" = "GLBSETRAN_IB_MYS_$ODATE1.CSV" ]; then
                          cp -p $PSFTPINDIR/$FILENAME $PSFTPINDIR/GLBSETRAN_IB_MYS_%ddmmyyyy%.CSV
                          mv $PSFTPINDIR/$FILENAME /prd/psftp/gbl/psbatch/archive
                          fi
                    fi
              done             
   fi
   
   
   if [ "$COUNTRY_CODE" = "SG" ]; then                          
     	ls GLBSETRAN_SGP_$ODATE1_BU148.CSV | while read FILENAME	
                 do
                       if [ $? = 0 ]; then
                          ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                                                                            
                          if [ "$FILENAME" = "GLBSETRAN_SGP_$ODATE1_BU148.CSV" ]; then
   			  cp -p $PSFTPINDIR/$FILENAME $PSFTPINDIR/GLBSETRAN_SGP_%ddmmyyyy%_BU148.CSV
                    	  mv $PSFTPINDIR/$FILENAME /prd/psftp/gbl/psbatch/archive
      		          fi
      		       fi   
                 done             
     ls GLBSETRAN_SGP_$ODATE1_BU150.CSV | while read FILENAME	
                 do
                       if [ $? = 0 ]; then
                          ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                                                                            
                          if [ "$FILENAME" = "GLBSETRAN_SGP_$ODATE1_BU150.CSV" ]; then
   			  cp -p $PSFTPINDIR/$FILENAME $PSFTPINDIR/GLBSETRAN_SGP_%ddmmyyyy%_BU150.CSV
                    	  mv $PSFTPINDIR/$FILENAME /prd/psftp/gbl/psbatch/archive
      		          fi
      		       fi   
                 done     		   
                             
ls GLBSETRAN_SGP_$ODATE1_BU287.CSV | while read FILENAME	
                 do
                       if [ $? = 0 ]; then
                          ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                                                                            
                          if [ "$FILENAME" = "GLBSETRAN_SGP_$ODATE1_BU287.CSV" ]; then
   			  cp -p $PSFTPINDIR/$FILENAME $PSFTPINDIR/GLBSETRAN_SGP_%ddmmyyyy%_BU287.CSV
                    	  mv $PSFTPINDIR/$FILENAME /prd/psftp/gbl/psbatch/archive
      		          fi
      		       fi   
                 done             
     ls GLBSETRAN_SGP_$ODATE1_BU288.CSV | while read FILENAME	
                 do
                       if [ $? = 0 ]; then
                          ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                              if [ "$FILENAME" = "GLBSETRAN_SGP_$ODATE1_BU288.CSV" ]; then
   			  cp -p $PSFTPINDIR/$FILENAME $PSFTPINDIR/GLBSETRAN_SGP_%ddmmyyyy%_BU288.CSV
                    	  mv $PSFTPINDIR/$FILENAME /prd/psftp/gbl/psbatch/archive
      		          fi
      		       fi   
                 done     		                                
   fi
