#!/usr/bin/ksh

#############################################                                   
# Set environment 
#############################################                                   
export DATASTAGE_DIR=/opt/IBM/InformationServer/Server/DSEngine/bin/
export DATASTAGE_DIR1=/prd/psftp/gbl/psbatch/scripts

#if [ $1 = J_Stg_Ftp_Psgl_Adj_Tb ];then
#	$ORACLE_HOME/bin/sqlplus $USERID/$PASSWD@PSFTDEV0 <<! > scb_run_analyse.tmp
#	set echo on
#	set feedback on
#	analyze table sysadm.stg_ftp_psgl_bal_tb compute statistics;
#	analyze table sysadm.stg_ftp_trans_temp1_tb  compute statistics;
#	analyze table sysadm.ps_scb_tprc_coa  compute statistics;
#	analyze table sysadm.ps_scb_tprc_coadtl compute statistics;
#
#fi

########################################################################################
# To check if the %ddmmyyyy% is present in FILENAME and replace it with Process/Order date
########################################################################################

#         if [ $1 = J_Stg_Ftp_Psgl_Adj_Tb ];then 
#            FILENAME=$2
#            DUMMYCHAR=%ddmmyyyy%
#            echo $FILENAME | grep -i $DUMMYCHAR

#           if [ $? = 0 ];then
#              ODATE=$4
#
#              ODATE_DD=`echo $ODATE | cut -c7-8`
#             ODATE_MM=`echo $ODATE | cut -c5-6`
#              ODATE_YYYY=`echo $ODATE | cut -c1-4`
#              NEW_ODATE=$ODATE_DD$ODATE_MM$ODATE_YYYY
#
#               FILENAME=`echo $FILENAME | sed "s/$DUMMYCHAR/$NEW_ODATE/g"`
#            fi
#            echo Translated Filename $FILENAME
#         fi

############################################# 
# Run Fact Jobs. 
#############################################                    

if test $1 = "J_Psgl_reconciliation_Process"
then
temp_var="J_Rec_Psgl_reconciliation"
else
   temp_var=$1
fi
               
export ORACLE_SID=PSFTPPRD
$ORACLE_HOME/bin/sqlplus $USERID/$PASSWD@PSFTPPRD <<! > scb_run.tmp
set echo on
set feedback on
insert into sysadm.PS_SCB_ETLPRCSCNTL values('$USERID',nvl('$temp_var',' '),nvl('$2',' '),nvl('$3',' '),nvl('$4',' '),nvl('$5',' '),'PSUNX',sysdate,NULL,'6','');

commit;
!


if test $1 = "J_Balance_Stg"  || test $1 = "J_Balance_Stg_1" || test $1 = "J_Cust_Dimension" || test $1 = "J_Opx_Balance_Stg" || test $1 = "J_Balance_Stg_ACB_GT" || test $1 = "J_EBBS_Balance_Stg"
  then
JOBNAME=`sh $DATASTAGE_DIR1/scb_jobname.sh | grep $1$4|awk -F: '{print $4}'`
#elif test $1 = "J_Psgl_reconciliation_Process" || test $1 = "J_Psgl_reconciliation_Process1"
 #then
#JOBNAME=`sh $DATASTAGE_DIR1/scb_jobname.sh | grep $1$3|awk -F: '{print $4}'`
else
JOBNAME=`sh $DATASTAGE_DIR1/scb_jobname.sh | grep $temp_var | awk -F: '{print $4}'`
fi
#echo $JOBNAME $temp_var $2 $3 $4 $5

              
#         if [ $1 = J_Stg_Ftp_Psgl_Adj_Tb ];then 
#             $DATASTAGE_DIR1/$JOBNAME $1 $FILENAME $3 $4 $5
#         else
             $DATASTAGE_DIR1/$JOBNAME $temp_var $2 $3 $4 $5
#         fi
             RETVAL=$?

             if [ ${RETVAL} -ne 0 ]
               then
                 echo "datastage is failed"
export ORACLE_SID=PSFTDEV0
$ORACLE_HOME/bin/sqlplus $USERID/$PASSWD@PSFTPPRD <<! > scb_run1.tmp
set echo on
set feedback on
update sysadm.PS_SCB_ETLPRCSCNTL set enddatetime = sysdate, runstatus = '3',batch_date = (SELECT ASOF_DT FROM SYSADM.PS_SCB_BATCH_DATE 
WHERE BUSINESS_UNIT IN (SELECT BUSINESS_UNIT FROM SYSADM.PS_SCB_BUS_UNIT WHERE SETID='MYSIA' AND ROWNUM<2))
where etl_job_name = '$temp_var' and startdatetime = (select max(startdatetime) from sysadm.PS_SCB_ETLPRCSCNTL where
etl_job_name = '$temp_var' and nvl(param1,' ') = nvl('$2',' ') and nvl(param2,' ') = nvl('$3',' ') and nvl(param3,' ') = nvl('$4',' ') and nvl(param4,' ') = nvl('$5',' '));

commit;
!

                 exit 2
             fi
export ORACLE_SID=PSFTPPRD
$ORACLE_HOME/bin/sqlplus $USERID/$PASSWD@PSFTPPRD <<! > scb_run2.tmp
set echo on
set feedback on

update sysadm.PS_SCB_ETLPRCSCNTL set enddatetime = sysdate, runstatus = '9',batch_date = (SELECT ASOF_DT FROM SYSADM.PS_SCB_BATCH_DATE 
WHERE BUSINESS_UNIT IN (SELECT BUSINESS_UNIT FROM SYSADM.PS_SCB_BUS_UNIT WHERE SETID='MYSIA' AND ROWNUM<2))
where etl_job_name = '$temp_var' and startdatetime = (select max(startdatetime) from sysadm.PS_SCB_ETLPRCSCNTL where
etl_job_name = '$temp_var' and nvl(param1,' ') = nvl('$2',' ') and nvl(param2,' ') = nvl('$3',' ') and nvl(param3,' ') = nvl('$4',' ') and nvl(param4,' ') = nvl('$5',' '));

commit;
!
        exit 0
done

#########################################
