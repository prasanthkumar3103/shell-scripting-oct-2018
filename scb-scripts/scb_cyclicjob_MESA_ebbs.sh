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
# 20080409   Ragavendra Dinesh       New program to UNZIP eBBS related files for MESA
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




if [ "$COUNTRY_CODE" = "U" ] ||  [ "$COUNTRY_CODE" = "D" ] ||  [ "$COUNTRY_CODE" = "O" ] || 
[ "$COUNTRY_CODE" = "Q" ] ||  [ "$COUNTRY_CODE" = "B" ] ||  [ "$COUNTRY_CODE" = "J" ] ||  [ "$COUNTRY_CODE" = "M" ]; then
   echo "$COUNTRY_CODE is Valid."
else
   echo "$COUNTRY_CODE is IN-VALID"
   exit 1
fi


if [ "$COUNTRY_CODE" = "U" ] ||  [ "$COUNTRY_CODE" = "D" ]; then
   ls ebbsaepsftp.tar.gz | while read FILENAME
        do
              if [ $? = 0 ]; then
                 ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                    
                    ########### unTar EBBS,EGLEX and Customer Master files ##############
                    
                    if [ "$FILENAME" = "ebbsaepsftp.tar.gz" ]; then
                    	export ebbs_folder_date=`date +%a_%b_%d_%y_%H_%M_%S`
                    	echo "ebbs_folder_date --------> $ebbs_folder_date"
                    	mkdir /prd/psftp/psbatch/gbl/incoming/eBBS/$ebbs_folder_date
                    	
                    	mv $PSFTPINDIR/$FILENAME /prd/psftp/psbatch/gbl/incoming/eBBS/$ebbs_folder_date/$FILENAME
                    	#gunzip ebbsaepsftp.tar.gz
                    	#tar -xf ebbsaepsftp.tar
                    fi
                    
                    ########### end of unTar script #######################
                    
                    
               fi
          done
          
     
     ls UAE_EGX_FTP_BAL.tar.gz | while read FILENAME
             do
                   if [ $? = 0 ]; then
                      ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                         
                         ########### unTar EBBS,EGLEX and Customer Master files #########
                         
                         if [ "$FILENAME" = "UAE_EGX_FTP_BAL.tar.gz" ]; then
                         	gunzip UAE_EGX_FTP_BAL.tar.gz
                         	sleep 20
                         	tar -xf UAE_EGX_FTP_BAL.tar
                         	sleep 20
                         	dos2unix $PSFTPINDIR/UAE_EGX_FTP_BAL
                         	sleep 30
                         fi
                         
                         ########### end of unTar script #######################
                         
                         
fi
          done
     
   fi
   
  if [ "$COUNTRY_CODE" = "B" ]; then
      ls ebbsbhpsftp.tar.gz | while read FILENAME
           do
                 if [ $? = 0 ]; then
                    ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                       
                       ########### unTar EBBS,EGLEX and Customer Master files #########
                       
                       if [ "$FILENAME" = "ebbsbhpsftp.tar.gz" ]; then
		          gunzip ebbsbhpsftp.tar.gz
		          tar -xf ebbsbhpsftp.tar
                       fi
                       
                       ########### end of unTar script ########################
                       
                       
                  fi
             done        
           
   fi
   
   if [ "$COUNTRY_CODE" = "J" ]; then
         ls ebbsjopsftp.tar.gz | while read FILENAME
              do
                    if [ $? = 0 ]; then
                       ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                          
                          ########### unTar EBBS,EGLEX and Customer Master files #########
                          
                          if [ "$FILENAME" = "ebbsjopsftp.tar.gz" ]; then
   		          gunzip ebbsjopsftp.tar.gz
   		          tar -xf ebbsjopsftp.tar
                          fi
                          
                          ########### end of unTar script ######################
                          
                          
                     fi
                done
                
   fi
   
   if [ "$COUNTRY_CODE" = "O" ]; then
         ls ebbsompsftp.tar.gz | while read FILENAME
              do
                    if [ $? = 0 ]; then
                       ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                          
                          ########### unTar EBBS,EGLEX and Customer Master files #########
                          
                          if [ "$FILENAME" = "ebbsompsftp.tar.gz" ]; then
   		          gunzip ebbsompsftp.tar.gz
   		          tar -xf ebbsompsftp.tar
                          fi
                          
                          ########### end of unTar script ##################
                          
                          
                     fi
                done
                
   fi

   
   if [ "$COUNTRY_CODE" = "Q" ]; then
         ls ebbsqapsftp.tar.gz | while read FILENAME
              do
                    if [ $? = 0 ]; then
                      ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                          
                          ########### unTar EBBS,EGLEX and Customer Master files #########
                          
                          if [ "$FILENAME" = "ebbsqapsftp.tar.gz" ]; then
   		          gunzip ebbsqapsftp.tar.gz
   		          tar -xf ebbsqapsftp.tar
                          fi
                          
                          ########### end of unTar script ####################
 
fi
done
fi
 
 if [ "$COUNTRY_CODE" = "Q" ]; then
         ls QAT_FIN_FTP_BAL.gz | while read FILENAME
              do
                    if [ $? = 0 ]; then
                      ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME

                          ########### unzip QATAR FINETL FILE #########

                          if [ "$FILENAME" = "QAT_FIN_FTP_BAL.gz" ]; then
                          gunzip QAT_FIN_FTP_BAL.gz
                          fi
                          ########### end of unzip script ####################                          
                          
                     fi
done
fi


if [ "$COUNTRY_CODE" = "M" ]; then
         ls MYS_BBS_FTP_BAL.tar.gz  | while read FILENAME
              do
                    if [ $? = 0 ]; then
                       ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                                                                         
                          if [ "$FILENAME" = "MYS_BBS_FTP_BAL.tar.gz" ]; then
   		          gtar -zxvf MYS_BBS_FTP_BAL.tar.gz
   		          fi
                         mv MYS_BBS_FTP_BAL.tar.gz /prd/psftp/gbl/psbatch/archive   	
	    fi
              done		    
   		
   	ls MYS_BBS_FTP_CM.tar.gz | while read FILENAME	
              do
                    if [ $? = 0 ]; then
                       ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                                                                         
                          if [ "$FILENAME" = "MYS_BBS_FTP_CM.tar.gz" ]; then
   		          gtar -zxvf MYS_BBS_FTP_CM.tar.gz
   		          fi
                        mv MYS_BBS_FTP_CM.tar.gz /prd/psftp/gbl/psbatch/archive
   		    fi
              done
              
   	ls MYS_BBS_FTP_INTSUM.tar.gz | while read FILENAME	
              do
                    if [ $? = 0 ]; then
                       ctmfw $PSFTPINDIR/$FILENAME CREATE $MIN_SIZE $SLEEP_INT $MON_INT $MIN_DETECT $WAIT_TIME
                                                                         
                          if [ "$FILENAME" = "MYS_BBS_FTP_INTSUM.tar.gz" ]; then
   		          gtar -zxvf MYS_BBS_FTP_INTSUM.tar.gz
   		          fi
                        mv MYS_BBS_FTP_INTSUM.tar.gz /prd/psftp/gbl/psbatch/archive
   		    fi
              done                                      
   fi


