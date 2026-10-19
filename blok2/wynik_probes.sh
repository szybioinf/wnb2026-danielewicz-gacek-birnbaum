#!/bin/bash

awk 'NR>=6 && (NR-6)%2==0' DArT_SNP.csv | awk -F',' ' {print $1, $2}' | awk '{ print ">" $1 "\n" $2 }' > probes.fa

grep -c '>' probes.fa

awk 'NR%2==0 { print length($0) }' probes.fa | sort -u
