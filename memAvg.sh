#!/bin/bash
cd ~
cd mem
#cat * > allmem
sed '1d; n; d' allmem > memUsed
sed 'n; d' allmem > memAval
d=$(date)
count=0;
total=0;

for i in $( awk '{ print $1; }' memUsed )
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
cd ~
cd memAvg
#echo -n "memory Used:" > "$(date)"
v=$(echo "scale=2; $total / $count" | bc) 
cd ~
cd mem

count=0;
total=0;

for i in $( awk '{ print $1; }' memAval )
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
cd ~
cd memAvg
#echo -n "memory Avaliable:" >> "$(date)"
w=$(echo "scale=2; $total / $count" | bc)
mysql --user=root --password=Fadi@1234 ansibleDB << EOF
INSERT INTO memInfo (avgused, avgaval) VALUES ('$v','$w');
EOF
cd ~
cd mem


