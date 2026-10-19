#!/bin/bash

#krok1 - kopiujemy plik z klastra do bieżącego katalogu
cp /lustre/pd03/hpc-bkozak-1727983696/Dydaktyka/wnb/DArT_SNP.csv ./

#krok2 - wyciągamy nazwy oraz sekwencje i zapisujemy do probes.fa
awk -F',' 'NR>=6 && (NR-6)%2==0 { print ">"$1"\n"$2 }' DArT_SNP.csv > probes.fa

#krok3 - sprawdzamy liczbę sekwencji (oczekiwany wynik = 2008)
grep -c '>' probes.fa

#krok4 - sprawdzamy długość sekwencji (oczekiwany wynik = 69)
awk 'NR%2==0 { print length($0) }' probes.fa | sort -u
