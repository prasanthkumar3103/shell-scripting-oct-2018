DIR=/prd/psftp/gbl/psbatch/archive

cd $DIR

find -type d -mtime +45 -exec rm -rf {} \;

exit 0;
