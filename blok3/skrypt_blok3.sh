#!/usr/bin/env bash

#pobranie genomu Lupinus angustifolius
#srodowisko -> biopython-env
#mamba activate biopython-env
#nadanie uprawnien dla skryptu find_biosample i pobranie BioSample dla UID 890181
chmod +x find_biosample.py
./find_biosample.py 890181
#srodowisko -> edirect-env
#mamba activate edirect-env
#pobranie genomu z NCBI
chmod +x get_genome.sh
./get_genome.sh bio_ids.txt
#przygotowywanie pliku genomu
#wylistowanie
echo "Pobrane archiwum genomu:"
ls -lh *.fna.gz
#rozpakowanie genomu referencyjnego
gunzip -c GCA_*_genomic.fna.gz > genome.fa
#kontrola poprawnosci pliku genomu
echo "Rozmiar rozpakowanego pliku genome.fa:"
ls -lh genome.fa
echo "Liczba wszystkich sekwencji (chromosomow i scaffoldow) w genome.fa: $(grep -c '>' genome.fa)"
echo "Pierwsze 3 naglowki sekwencji w genomie:"
grep '>' genome.fa | head -3
echo "Podzial sekwencji wedlug prefiksu (CM = chromosomy, KV/ML = scaffoldy):"
grep '>' genome.fa | awk '{print substr($1,2,2)}' | sort | uniq -c

#ekstrakcja sond i informacji o SNP
#wyodrebnienie sekwencji sond (wiersze parzyste od 6)
awk -F',' 'NR>=6 && (NR-6)%2==0 { print ">"$1"\n"$2 }' DArT_SNP.csv > probes.fa
echo "Liczba wyodrebnionych sond w probes.fa: $(grep -c '>' probes.fa)"
echo "Dlugosc sekwencji sond (nt): $(awk 'NR%2==0 { print length($0) }' probes.fa | sort -u)"
#wyodrebnienie pozycji i alleli SNP (wiersze nieparzyste od 7)
awk -F',' -v OFS='\t' 'NR>=7 && (NR-7)%2==0 { print $1, $11 }' DArT_SNP.csv > dart_info_oneline.tsv
echo "Liczba rekordow w dart_info_oneline.tsv: $(wc -l < dart_info_oneline.tsv)"
#kontrola zgodnosci identyfikatorow w obu plikach (Cwiczenie 3.2)
#w DArT_SNP.csv kazdy marker zajmuje dwa kolejne wiersze (parzysty dla allelu referencyjnego, nieparzysty dla alternatywnego)
#porownanie chroni przed cichym przesunieciem wierszy i potwierdza ze oba polecenia wyodrebnily te same markery w identycznej kolejnosci
echo "Sprawdzanie zgodnosci identyfikatorow miedzy probes.fa a dart_info_oneline.tsv:"
diff <(grep '>' probes.fa | tr -d '>') <(cut -f1 dart_info_oneline.tsv) && echo "ZGODNE"

#budowa bazy i mapowanie sond (blast)
#srodowisko -> blast-env
#mamba activate blast-env
mkdir -p db
makeblastdb -in genome.fa -dbtype nucl -out db/genome

blastn \
  -task blastn \
  -db db/genome \
  -query probes.fa \
  -out blast_raw.tsv \
  -evalue 1e-10 \
  -max_target_seqs 1 \
  -num_threads 4 \
  -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore"

#kontrola wynikow blast
echo "Liczba wszystkich surowych trafien w blast_raw.tsv: $(wc -l < blast_raw.tsv)"
echo "Liczba unikalnych sond z jakimkolwiek trafieniem: $(cut -f1 blast_raw.tsv | sort -u | wc -l)"

#filtrowanie, wybor najlepszego trafienia i orientacja nici
awk -F'\t' -v OFS='\t' '$3 >= 96 && $4 >= 68' blast_raw.tsv > blast_filtered.tsv
echo "Liczba trafien po filtrowaniu (blast_filtered.tsv): $(wc -l < blast_filtered.tsv)"
echo "Liczba unikalnych sond po filtrowaniu: $(cut -f1 blast_filtered.tsv | sort -u | wc -l)"

sort -k1,1 -k12,12gr blast_filtered.tsv \
  | awk -F'\t' '!widziane[$1]++' > blast_best.tsv
echo "Liczba sond po wyborze najlepszego trafienia (blast_best.tsv): $(wc -l < blast_best.tsv)"

awk -F'\t' -v OFS='\t' '{ print $0, ($9 < $10 ? "+" : "-") }' blast_best.tsv > dart_blast_filtered.tsv
echo "Liczba koncowych markerow w dart_blast_filtered.tsv: $(wc -l < dart_blast_filtered.tsv)"
echo "Rozklad orientacji nici (+ / -) w pliku koncowym:"
cut -f13 dart_blast_filtered.tsv | sort | uniq -c
