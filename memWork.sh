
#! /bin/sh
cd ~
cd mem
x=$(date)
free | head -2 | tail -1 | awk '{print $3}' > "$x" 
free | head -2 | tail -1 | awk '{print $4}' >> "$x"

