#!/bin/bash
cd ~/cHour
sudo tail -n 60 ~/minUtily.txt > test.txt
count=0;
total=0; 

for i in $( awk '{ print $1; }' test.txt )
   do 
     total=$(echo $total+$i | bc )
     ((count++))
   done
d=$(date)
v=$(echo "scale=2; $total / $count" | bc)

mysql --user=root --password=Fadi@1234 ansibleDB << EOF
INSERT INTO cpuInfo (avg) VALUES ('$v');
EOF 
