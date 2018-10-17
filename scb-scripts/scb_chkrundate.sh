###############################################################################
# This Script will check the UPDATE RUN CONTROL PANEL DATE & BATCH ORDER DATE.
# If it mismatch, Script will error out.
# This will help to avoid running batch for wrong date.
#
# Hexaware
# 10-Oct-2007
#
################################################################################

OPRID=$1;

echo $OPRID;

RUNCONTROLID=$2;

echo $RUNCONTROLID;

ORDERDATE=$3;

if [ "$OPRID" = "" ]; then
  echo Parameter OPERATOR ID required
  exit 1;
fi

if [ "$RUNCONTROLID" = "" ]; then
  echo Parameter RUN CONTROL ID required
  exit 1;
fi

if [ "$ORDERDATE" = "" ]; then
  echo Parameter ORDER DATE  required
  exit 1;
fi


DD=`echo $ORDERDATE | cut -c7-8`;
MM=`echo $ORDERDATE | cut -c5-6`;
YYYY=`echo $ORDERDATE | cut -c1-4`;

ETLDATE=$DD$MM$YYYY;

case "$MM" in
01 )
  mon_str=Jan
  ;;
02 )
  mon_str=Feb
  ;;
03 )
  mon_str=Mar
  ;;
04 )
  mon_str=Apr
  ;;
05 )
  mon_str=May
  ;;
06 )
  mon_str=Jun
  ;;
07 )
  mon_str=Jul
  ;;
08 )
  mon_str=Aug
  ;;
09 )
  mon_str=Sep
  ;;
10 )
  mon_str=Oct
  ;;
11 )
  mon_str=Nov
  ;;
12 )
  mon_str=Dec
  ;;
esac

echo Month $mon_str

RUNDATE_FORMAT=$DD$mon_str$YYYY;
a=`pwd`
b=`whoami`
echo Dir $a
echo Auth $b
TMPOUTPUT=scb_runsql_$$.tmp

echo $TMPOUTPUT

$ORACLE_HOME/bin/sqlplus $USERID/$PASSWD@PSFTPPRD  <<! > $TMPOUTPUT
set echo on
set feedback on

select
  distinct 'DATEEXISTS' from sysadm.ps_scb_batch_date
where
  oprid = '$OPRID'
  and runcntlid = '$RUNCONTROLID'
  and asof_dt = '$RUNDATE_FORMAT';
!
   echo temp file $TMPOUTPUT
   cat $TMPOUTPUT | grep DATEEXISTS > output
  if [ $? != 0 ]; then
      echo "\n\nError:  Update Run Control Date & Order Date Mismatch "
     # rm -f $TMPOUTPUT
      exit 1
   fi

#rm -f $TMPOUTPUT
