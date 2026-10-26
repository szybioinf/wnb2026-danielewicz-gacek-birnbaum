#Przygotowanie pliku genomu
gunzip -c GCA_*_genomic.fna.gz > genome.fa

#Ekstrakcja sond do formatu fasta
awk -F',' 'NR>=6 && (NR-6)%2==0 { print ">"$1"\n"$2 }' DArT_SNP.csv > probes.fa

awk -F',' -v OFS='\t' 'NR>=7 && (NR-7)%2==0 { print $1, $11 }' DArT_SNP.csv > dart_info_oneline.tsv

#Sprawdzenie identyfikatorów
diff <(grep '>' probes.fa | tr -d '>') <(cut -f1 dart_info_oneline.tsv) && echo "ZGODNE"

#Zindeksowanie genomu
mkdir -p db
makeblastdb -in genome.fa -dbtype nucl -out db/genome

#Mapowanie sond
blastn \
-task blastn \
-db db/genome \
-query probes.fa \
-out blast_raw.tsv \
-evalue 1e-10 \
-max_target_seqs 1 \
-num_threads 4 \
-outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore"

#Filtrowanie trafień
awk -F'\t' -v OFS='\t' '$3 >= 96 && $4 >= 68' blast_raw.tsv > blast_filtered.tsv

#Wybór najlepszych trafień
sort -k1,1 -k12,12gr blast_filtered.tsv \
| awk -F'\t' '!widziane[$1]++' > blast_best.tsv

#Dodanie orientacji nici
awk -F'\t' -v OFS='\t' '{ print $0, ($9 < $10 ? "+" : "-") }' blast_best.tsv > dart_blast_filtered.tsv
