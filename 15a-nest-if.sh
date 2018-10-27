a=10
b=12
c=13

if [ "$a" != "$b" ] && [ "$a" != "$c" ] && [ "$b" != "$c" ]
then
   echo "$a $b $c are different values"

   if [ $a = $b ]
   then
       echo "$a $b both are equal"
   else
       echo "$a $b are not equal"
   fi

   if [ $a = $c ]
   then
       echo "$a $c are equal"
   else
       echo "$a $c are not equal"

   fi

   if [ $b = $c ]
   then
       echo "$b $c are equal"
   else
       echo "$b $c are not equal"
   fi
else
   echo "None Matched"
fi
