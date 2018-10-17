#!/usr/bin/ksh

#############################################                                   
# Set environment 
#############################################                                   
#FTP_FILE=${SCRIPT_DIR}/a_DTL.txt
IN_DIR=/prd/psftp/gbl/psbatch/incoming
OUT_DIR=/prd/psftp/gbl/psbatch/outgoing
SRC_DIR=/prd/psftp/gbl/psbatch
export DATASTAGE_DIR=/opt/IBM/InformationServer/Server/DSEngine/bin
export DATASTAGE_DIR1=/prd/psftp/gbl/psbatch/scripts
PROJNAME=FTP_PROD_MYSIA
FILENAME=`sh $DATASTAGE_DIR1/scb_jobname.sh | grep $1 |awk -F: '{print $3}'`
JOBNAME="$PROJNAME $1 " 
echo $JOBNAME
FTP_FILE=$IN_DIR/$FILENAME
ARCH_DIR=${SRC_DIR}/archive
ARCH_DATE=`date +%y%m%d`
FILET=2
TIMEOUT_CHECK=300 # 1/2an hour
############################################# 
# Run Fact Jobs. 
#############################################                                   
#if test $1 = "J_Psgl_reconciliation_Process" || test $1 = "J_Psgl_reconciliation_Process1" 
#then
 # SC=`sh $DATASTAGE_DIR1/scb_jobname.sh $1 $2 $3 $4 $5| grep $1$3 |awk -F: '{print $2}'`$JOBNAME
#else
SC=`sh $DATASTAGE_DIR1/scb_jobname.sh $1 $2 $3 $4 $5| grep $1 |awk -F: '{print $2}'`$JOBNAME
#fi
             $DATASTAGE_DIR/dsjob -run -mode RESET -wait -jobstatus $JOBNAME
           sleep 10
              $DATASTAGE_DIR/$SC
      
             RETVAL=$?

             if [ ${RETVAL} -ge 3 ]
               then
                 echo "datastage is failed"
                 exit 2
             fi
if test $1 = "J_B_Cpr_Feed" || test $1 = "J_B_Cpr_Adj_Feed" || test $1 = "J_CBPB_B_Cpr_Adj_Feed" || test $1 = "J_CBPB_B_Cpr_Feed" ||  test $1 = "J_New_B_Cpr_Feed" || test $1 = "J_B_Cpr_Feed_FTP"
then
cat $OUT_DIR/$3'_CTL.txt'  $OUT_DIR/$3'.txt'  $OUT_DIR/$3'_TRL.txt' >> $OUT_DIR/$3'_DTL.txt'
rm $OUT_DIR/$3'_CTL.txt' $OUT_DIR/$3'.txt' $OUT_DIR/$3'_TRL.txt'
mv $OUT_DIR/$3'_DTL.txt' $OUT_DIR/$3
fi
if test $1 = "J_Pas_Feed" || test $1 = "J_Pas_Adj_Feed"
then
cat $OUT_DIR/$3'_CTL.txt'  $OUT_DIR/$3'_DTL.txt'  >> $OUT_DIR/$3
rm $OUT_DIR/$3'_CTL.txt' $OUT_DIR/$3'_DTL.txt'
fi

ODATE=$4

   YYYY=`echo $ODATE | cut -c1-4`
   MM=`echo $ODATE | cut -c5-6`
   DD=`echo $ODATE | cut -c7-8`

ODATE=$DD$MM$YYYY


if test $1 = "J_BW12_GT_DATA"
     then
        cat $OUT_DIR/$3'_CTL.csv'  $OUT_DIR/$3'_DTL.csv'  $OUT_DIR/$3'_TRL.csv' >> $OUT_DIR/$3'.CSV'
         rm $OUT_DIR/$3'_CTL.csv' $OUT_DIR/$3'_DTL.csv' $OUT_DIR/$3'_TRL.csv'
         mv $OUT_DIR/$3'.CSV' $OUT_DIR/$3_$ODATE'.CSV'
fi




ODATE=$4

   YY=`echo $ODATE | cut -c1-4`
   
ODATE=$4

   YY=`echo $ODATE | cut -c3-4`
   MM=`echo $ODATE | cut -c5-6`
   DD=`echo $ODATE | cut -c7-8`

ODATE=$DD$MM$YY

if test $1 = "J_BW1_INSTR_IBAL" || test $1 = "J_BW2_IOTHER" || test $1 = "J_BW3_CIF_FTP_RATE" || test $1 = "J_BW4_CAF" || test $1 = "J_BW6_EX_RATE" || test $1 = "J_BW5_EOD_SOD_RATE" || test $1 = "J_BW6_EX_RATE" || test $1 = "J_BW7_PF_LEDGER" ||  test $1 = "J_BW8_PF_LEDGER_NONFTP" || test $1 = "J_BW9_HEDGE" || test $1 = "J_BW10_OPX_FWDST"

then
        cat $OUT_DIR/$3'_CTL.csv'  $OUT_DIR/$3'_DTL.csv'  $OUT_DIR/$3'_TRL.csv' >> $OUT_DIR/$3'.CSV'
         rm $OUT_DIR/$3'_CTL.csv' $OUT_DIR/$3'_DTL.csv' $OUT_DIR/$3'_TRL.csv'
         mv $OUT_DIR/$3'.CSV' $OUT_DIR/$3_$ODATE'.csv'
fi


mv ${FTP_FILE} ${ARCH_DIR}/${FILENAME}_${ARCH_DATE}.txt

        exit 0
done

#########################################

