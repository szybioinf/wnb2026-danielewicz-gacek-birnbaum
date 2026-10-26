#!/bin/bash

gunzip -c GCA_*_genomic.fna.gz > genome.fa
mkdir -p data/ref
mv genome.fa data/ref/

# Punkt 7: Ekstrakcja sond do formatu FASTA
awk -F',' 'NR>=6 && (NR-6)%2==0 { print ">"$1"\n"$2}' DArT_SNP.csv > probes.fa

# Punkt 8: Ekstrakcja informacji o SNP
awk -F',' -v OFS='\t' 'NR>=7 && (NR-7)%2==0 { print $1, $11}' DArT_SNP.csv > dart_info_oneline.tsv

# Punkt 11: Budowa bazy
mkdir -p db
makeblastdb -in data/ref/genome.fa -dbtype nucl -out db/genome

# Punkt 12: Mapowanie sond
blastn \
  -task blastn \
  -db db/genome \
  -query probes.fa \
  -out blast_raw.tsv \
  -evalue 1e-10 \
  -max_target_seqs 1 \
  -num_threads 4 \
  -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Punkt 13: Filtrowanie trafień
awk -F'\t' -v OFS='\t' '$3 >= 96 && $4 >= 68' blast_raw.tsv > blast_filtered.tsv

# Punkt 14: Problem wielu dopasowań - wybór najlepszego trafienia
sort -k1,1 -k12,12gr blast_filtered.tsv | awk -F'\t' '!widziane[$1]++' > blast_best.tsv

# Punkt 15: Wyznaczenie orientacji nici
awk -F'\t' -v OFS='\t' '{ print $0, ($9 < $10 ? "+" : "-") }' blast_best.tsv > dart_blast_filtered.tsv
