#!/bin/bash
awk -F ',' 'NR>=6 && (NR-6)%2==0 { print ">"$1"\n"$2 }' DArT_SNP.csv > probes.fa
grep -c '>' probes.fa
awk 'NR%2==0 {print length($0) }' probes.fa | sort -u
