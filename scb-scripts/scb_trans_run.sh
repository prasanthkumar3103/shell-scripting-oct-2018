#!/usr/bin/ksh

############################################                                   
# Set environment 
#############################################                                   
#FTP_FILE=${SCRIPT_DIR}/a_DTL.txt
SRC_DIR=/prd/psftp/gbl/psbatch
IN_DIR=/prd/psftp/gbl/psbatch/incoming
export DATASTAGE_DIR=/opt/IBM/InformationServer/Server/DSEngine/bin
export DATASTAGE_DIR1=/prd/psftp/gbl/psbatch/scripts
LATEST_DIR=${SRC_DIR}/latest
ARCH_DIR=${SRC_DIR}/archive
ARCH_DATE=`date +%y%m%d`
PROJNAME=FTP_PROD_MYSIA
JOBNAME="$PROJNAME $1 " 
FILENAME=`sh $DATASTAGE_DIR1/scb_jobname.sh | grep $1 |awk -F: '{print $3}'`
FTP_FILE=$IN_DIR/$FILENAME
FILET=2
TIMEOUT_CHECK=300 # 1/2an hour
#################################################################
#  check if the file has changed from previous loads
#################################################################
    if [ ! -e ${FTP_FILE} ]
    then
  	echo "   ERROR: file does not exist. Exit refresh" 
  	echo "LOAD_DIRECT: ${DATA_FILE} does not exist. Exit refresh" 
	exit 1
    fi
    LATEST_FILE=${LATEST_DIR}/${FILENAME}.txt
    if [ -e ${LATEST_FILE} ]
    then
	NDIFF=$(diff ${FTP_FILE} ${LATEST_FILE} | wc -l )
    else
	NDIFF=1
    fi

    if [ ${NDIFF} = 0 ]
    then
	echo "   file identical to latest - not processed" 
         rm -f ${FTP_FILE}
	exit 0 
    fi

#################################################################
############################################# 
# Else process Translation files. 
#############################################                                  
       if test -s ${FTP_FILE}       
         then 
              `sh $DATASTAGE_DIR1/scb_splitfile.sh  ${FTP_FILE} `
         SC=`sh $DATASTAGE_DIR1/scb_jobname.sh $1 $2 $3 $4 $5| grep $1 |awk -F: '{print $2}'`$JOBNAME
             $DATASTAGE_DIR/dsjob -run -mode RESET -wait -jobstatus $JOBNAME
              $DATASTAGE_DIR/$SC
      
             RETVAL=$?

             if [ ${RETVAL} -ge 3 ]
               then
                 echo "datastage is failed"
                 exit 2
             fi
           cp ${FTP_FILE} ${LATEST_FILE} 	
             mv ${FTP_FILE} ${ARCH_DIR}/${FILENAME}_${ARCH_DATE}.txt 
            rm -r ${FTP_FILE}_DTL.txt
            rm -r ${FTP_FILE}_CTL.txt
          exit 0
        else
             echo "  Exiting Process: FTP details file empty or does not exist."  
             exit 2
     fi

#########################################
