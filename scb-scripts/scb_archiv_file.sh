########################################################################################
# Program ID      : scb_archiv_file.sh
#
# Function        : New Archive Script for File Management of MY
#
#
# Program History :
#
# Date       Amended By              Changes/Remarks
# ========   =====================   ===============
#
# 20120613   Priyanka        New Archive Script Customized for file management
########################################################################################

cd /prd/psftp/gbl/psbatch/archive
export BkupDate=`date +%Y%m%d`
mkdir $BkupDate
mkdir $BkupDate/MYSIA
gzip MY*
gzip GLB*MY*
mv MY*.gz $BkupDate/MYSIA
mv GLB*MY*.gz $BkupDate/MYSIA
chmod -R 775 /prd/psftp/gbl/psbatch/archive/$BkupDate
cd /prd/psftp/gbl/psbatch/archive/incoming
mkdir $BkupDate
mkdir $BkupDate/MYSIA
cd /prd/finance/psftp/incoming
gzip MY*
gzip GLB*MY*
mv MY*.gz /prd/psftp/gbl/psbatch/archive/incoming/$BkupDate/MYSIA
mv GLB*MY*.gz /prd/psftp/gbl/psbatch/archive/incoming/$BkupDate/MYSIA
chmod -R 775 /prd/psftp/gbl/psbatch/archive/incoming/$BkupDate
cd /prd/finance/psftp/outgoing
gzip MY*
mv BW*303* /prd/psftp/gbl/psbatch/archive/$BkupDate/MYSIA
mv BW*660* /prd/psftp/gbl/psbatch/archive/$BkupDate/MYSIA
mv MY* /prd/psftp/gbl/psbatch/archive/$BkupDate/MYSIA
chmod -R 775 /prd/psftp/gbl/psbatch/archive/$BkupDate

cd /prd/psftp/gbl/psbatch/outgoing
mv *MYSIA*FINREP*  /prd/psftp/gbl/psbatch/archive/$BkupDate/MYSIA
rm MY_FTP*dat*

exit 0
