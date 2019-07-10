cd ~
x=$(mpstat | head -4 | tail -1 | awk '{print $13}')
echo "scale=2; 100 - $x " | bc >> minUtily.txt 
