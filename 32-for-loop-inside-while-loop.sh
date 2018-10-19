	###################################################################################
	# !/bin/bash
	# Description: for loop inside a while loop
	###################################################################################


var1=5

while [ $var1 -ge 1 ]
do
  echo "Outer loop $var1" # it results like outer loop start from 5 to 1
  for (( var2 =1; $var2 <=3; var2++ )) #printing 3 list table till 5
  do
     var3=$[ $var1 * $var2 ] # it does like 5*1 5*2 5 *3,like this till 1
     echo "   Inner loop: $var1 * $var2 = $var3" #storing each iteration values in var3 and giving result for var3
  done
  var1=$[ $var1 - 1 ] #condition to go from top ( 5 ,4,3,2,1)
done
    
