# !/bin/bash
# Using the continue command

for (( var1 =1; var1 < 15; var1++ ))
do
   if [ $var1 -gt 5 ] && [ $var1 -lt 10 ]
   then
        continue
   fi
   echo " Iteration is: $var1"
done


# condition does the value is greater than 5 and less than 0) the shell executes the continue command.
