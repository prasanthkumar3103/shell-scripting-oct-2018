

#!/bin/bash
# changing the IFS value

IFS.OLD=$IFS
IFS=$'\'

for entry in $(cat /etc/paswd)
do
  echo "Values in $entry - "
  IFS=:
  for value in $entry
  do
     echo "    $value"
  done
done
