#! /bin/sh
cd ~
cd disk
x=$(date) 
df --total | tail -n 1 | awk '{print $3}' > $x 
df --total | tail -n 1 | awk '{print $4}' >> $x

