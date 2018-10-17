#!/usr/bin/ksh

#############################################                                   
# Set environment 
#############################################                                   
#FTP_FILE=${SCRIPT_DIR}/a_DTL.txt
SRC_DIR=/prd/psftp/gbl/psbatch
IN_DIR=/prd/psftp/gbl/psbatch/incoming
export DATASTAGE_DIR=/opt/IBM/InformationServer/Server/DSEngine/bin
export DATASTAGE_DIR1=/prd/psftp/gbl/psbatch/scripts
PROJNAME=FTP_PROD_MYSIA
FILENAME=$2
JOBNAME="$PROJNAME $1 "
FTP_FILE=$IN_DIR/$FILENAME
ARCH_DIR=${SRC_DIR}/archive
ARCH_DATE=`date +%y%m%d`
FILET=2
TIMEOUT_CHECK=300 # 1/2an hour
#####################################################################
# usage function
#####################################################################
usage()
{
   echo "Usage:"
   echo "${0} jobname  "
}

############################################# 
# Get FTP details. 
#############################################                                   
echo $FTP_FILE
    while [ ${FILET} != 0  ]
     do
       if test -s ${FTP_FILE}       
         then 
      if test $1 = "J_stg_ftp_psgl_bal_tb" 
           then 
          `sh $DATASTAGE_DIR1/scb_psgltrl.sh ${FTP_FILE} `
      elif  test $1 = "J_EOD_Rates" 
           then
            `sh $DATASTAGE_DIR1/scb_eodsplitfile.sh ${FTP_FILE} `
     elif  test $1 = "J_Stg_Ftp_Psgl_Adj_Tb"
            then
                t=1
       else
           `sh $DATASTAGE_DIR1/scb_splitfile.sh  ${FTP_FILE} `
       fi
            SC=`sh $DATASTAGE_DIR1/scb_jobname.sh $1 $2 $3 $4 $5| grep $1$4 |awk -F: '{print $2}'`$JOBNAME
       if test $1 = "J_Exchange_Rates" 
          then
             SC=`sh $DATASTAGE_DIR1/scb_jobname.sh $1 $2 $3 $4 $5| grep $1 |awk -F: '{print $2}'`$JOBNAME
       fi
             $DATASTAGE_DIR/dsjob -run -mode RESET -wait -jobstatus $JOBNAME
           sleep 10
              $DATASTAGE_DIR/$SC
      
             RETVAL=$?

             if [ ${RETVAL} -ge 3 ]
               then
                 echo "datastage is failed"
                 exit 2
             fi
      if test $1 = "J_stg_ftp_psgl_bal_tb"
           then
             rm -r $IN_DIR/${FILENAME}_TRL.txt
         rm -r $IN_DIR/${FILENAME}_DTL.txt
      elif  test $1 = "J_EOD_Rates"
           then
               rm -r $IN_DIR/${FILENAME}.txt
      elif test $1 = "J_Stg_Ftp_Psgl_Adj_Tb"
             then 
           t=1
       else
            rm -r $IN_DIR/${FILENAME}_CTL.txt
         rm -r $IN_DIR/${FILENAME}_DTL.txt
       fi
     if test $2  !=  "MYS_BBS_FTP_INTSUM"
	then 
           mv ${FTP_FILE} ${ARCH_DIR}/${FILENAME}_${ARCH_DATE}.txt
      fi
        exit 0
        else
           sleep 10

            TOTAL_TIME=$(expr ${TOTAL_TIME} + 60)
            if [ ${TOTAL_TIME} -ge ${TIMEOUT_CHECK} ]
              then
               #`${ORACLE_HOME}/bin/sqlplus /nolog @${SCRIPT_DIR}/set_cntrl.sql`
               echo "  Exiting Process: FTP details file empty or does not exist."  
             exit 2
           fi  
     fi
done

#########################################
