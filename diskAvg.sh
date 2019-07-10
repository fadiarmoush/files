#!/bin/bash
cd ~
cd disk
#cat * > allDisk
sed '1d; n; d' allDisk > diskUsed
sed 'n; d' allDisk > diskAval
d=$(date)
count=0;
total=0;

for i in $( awk '{ print $1; }' diskUsed )
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
cd ~
cd dAvg
#echo -n "Disk Used:" > "$(date)"
w=$(echo "scale=2; $total / $count" | bc) 
echo $w
cd ~
cd disk
 
count=0;
total=0;

for i in $( awk '{ print $1; }' diskAval )
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
cd ~
cd dAvg

#echo -n "Disk Avaliable:" >> "$(date)"
v=$(echo "scale=2; $total / $count" | bc)
echo $v
mysql --user=root --password=Fadi@1234 ansibleDB << EOF
INSERT INTO diskInfo (avgused, avgaval) VALUES ('$w','$v');
EOF 

cd ~
cd disk
#rm allDisk
#rm diskAval

#rm diskUsed
