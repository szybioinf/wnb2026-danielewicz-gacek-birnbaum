#Podpięcie katalogu
ln -s ~/wnb2026/blok3 blok3
ls -l blok3
ls blok3/dart_blast_filtered.tsv blok3/dart_info_oneline.tsv

#Sprawdzenie liczby kolumn
awk -F'\t' '{ print NF; exit }' blok3/dart_blast_filtered.tsv

#Rozbicie opisu SNP na kolumny
awk -F'\t' -v OFS='\t' '
{
split($2, a, "[:>]")
print $1, a[1], a[2], a[3]
}' blok3/dart_info_oneline.tsv > dart_info_split.tsv

#Sprawdzenie wypełnienia kolumn
awk -F'\t' 'NF != 4 || $2 == "" { print NR": "$0 }' dart_info_split.tsv | head

#Złączenie tabel
awk -F'\t' -v OFS='\t' '
NR==FNR { info[$1] = $2 OFS $3 OFS $4; next }
{ print $0, ($1 in info ? info[$1] : OFS OFS) }
' dart_info_split.tsv blok3/dart_blast_filtered.tsv > dart_blast_with_snp.tsv

#Sprawdzenie
awk -F'\t' '{ print NF; exit }' dart_blast_with_snp.tsv

#Obliczenie pozycji genomowej
awk -F'\t' -v OFS='\t' '
{
sstart = $9
strand = $13
snp = $14
if (strand == "+") gpos = sstart + snp
else if (strand == "-") gpos = sstart - snp
else gpos = "NA"
print $0, gpos
}' dart_blast_with_snp.tsv > dart_blast_with_genomic_snp.tsv

#Sprawdzenie pozycji poza zakresem dopasowania
awk -F'\t' '
$13=="+" && ($NF < $9 || $NF > $10) { zle++ }
$13=="-" && ($NF > $9 || $NF < $10) { zle++ }
END { print "poza zakresem:", zle+0 }
' dart_blast_with_genomic_snp.tsv

#Wykonanie tabeli wariantów
awk -F'\t' -v OFS='\t' '
BEGIN { print "CHROM","POS","ID","REF","ALT","STRAND" }
{ print $2, $NF, $1, $15, $16, $13 }
' dart_blast_with_genomic_snp.tsv > step1_core.tsv

#Korekta alleli dla nici minus
awk -F'\t' -v OFS='\t' '
function rc(b) {
if (b == "A") return "T"
if (b == "T") return "A"
if (b == "C") return "G"
if (b == "G") return "C"
return b
}
NR == 1 { print; next }
{
if ($6 == "-") { $4 = rc($4); $5 = rc($5) }
print
}
' step1_core.tsv > step2_core_rc.tsv

#Konwersja na genotypy
awk -F',' -v OFS='\t' '
NR == 5 {
nsamp = NF - 25
printf "ID"
for (i = 26; i <= NF; i++) printf OFS $i
printf "\n"
next
}
NR < 6 { next }
{
start = NF - nsamp + 1
if (prev == "") {
prev = $1
for (i = start; i <= NF; i++) ref[i - start] = $i
next
}
printf "%s", $1
for (i = start; i <= NF; i++) {
r = ref[i - start]
a = $i
if (r == "-" || a == "-") gt = "./."
else if (r == 1 && a == 0) gt = "0/0"
else if (r == 0 && a == 1) gt = "1/1"
else if (r == 1 && a == 1) gt = "0/1"
else gt = "./."
printf OFS gt
}
printf "\n"
prev = ""
}' blok3/DArT_SNP.csv > dart_genotypes.tsv

#Sprawdzenie konwersji na genotypy
wc -l < dart_genotypes.tsv
awk -F'\t' '{ print NF; exit }' dart_genotypes.tsv
cut -f2- dart_genotypes.tsv | tail -n +2 | tr '\t' '\n' | sort | uniq -c

#Dołączenie genotypów
awk -F'\t' -v OFS='\t' '
NR == FNR {
if (FNR == 1) { h = $0; next }
id = $1; $1 = ""; sub(/^\t/, "", $0); g[id] = $0; next
}
FNR == 1 {
tmp = h; sub(/^ID\t?/, "", tmp)
print $0, tmp; next
}
{ print $0, ($3 in g ? g[$3] : "") }
' dart_genotypes.tsv step2_core_rc.tsv > step3_with_genotypes.tsv

#Sortowanie
{ head -n 1 step3_with_genotypes.tsv
tail -n +2 step3_with_genotypes.tsv | LC_ALL=C sort -t$'\t' -k1,1 -k2,2n
} > step3_sorted.tsv

#Zapis pliku VCF
awk -F'\t' -v OFS='\t' '
NR == 1 {
print "##fileformat=VCFv4.2"
print "##source=DArT-BLAST-pipeline"
print "##INFO=<ID=STRAND,Number=1,Type=String,Description=\"Orientacja dopasowania BLAST\">"
print "##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">"
printf "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT"
for (i = 7; i <= NF; i++) printf "\t%s", $i
printf "\n"
next
}
{
printf "%s\t%s\t%s\t%s\t%s\t.\tPASS\tSTRAND=%s\tGT", $1, $2, $3, $4, $5, $6
for (i = 7; i <= NF; i++) printf "\t%s", $i
printf "\n"
}' step3_sorted.tsv > final.vcf

#Kontrola podstawowa
grep -c '^##' final.vcf
grep -vc '^#' final.vcf
awk -F'\t' '!/^#/ { print NF }' final.vcf | sort -u
grep -v '^#' final.vcf | cut -f3 | sort | uniq -d | wc -l

#Kontrola narzędziem bcftool
bcftools view final.vcf > /dev/null && echo "Plik poprawny formalnie"

#Kontrola spójności z genomem
samtools faidx blok3/genome.fa

awk -F'\t' 'NR > 1 { print $1":"$2"-"$2 }' step2_core_rc.tsv > regiony.txt
samtools faidx -r regiony.txt blok3/genome.fa | grep -v '>' > zasady.txt

paste <(tail -n +2 step2_core_rc.tsv | cut -f1-5) zasady.txt \
| awk -F'\t' '
{
g = toupper($6)
r = toupper($4)
a = toupper($5)
if (g == r) eq_ref++
else if (g == a) eq_alt++
else poza++
}
END {
n = eq_ref + eq_alt + poza
print "genom = DArT REF:", eq_ref+0
print "genom = DArT ALT:", eq_alt+0
print "poza {REF,ALT}: ", poza+0
printf "spójnych (REF lub ALT): %.1f%%\n", 100*(eq_ref+eq_alt)/n
}'

