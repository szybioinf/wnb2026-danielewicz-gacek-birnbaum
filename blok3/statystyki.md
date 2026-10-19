# Statystyki - Blok 3 (Genom referencyjny i mapowanie BLAST)

## 1. Złożenie genomu
- Gatunek: *Lupinus angustifolius* (odmiana Tanjil)
- Złożenie (Assembly UID): GCA_001865875.1
- Liczba sekwencji: 13573 (20 chromosomów CM, 13553 scaffoldy KV/ML)

## 2. Podsumowanie etapów przetwarzania sond DArT

| Etap | Liczba wierszy / dopasowań | Liczba unikalnych sond | Komentarz |
| :--- | :---: | :---: | :--- |
| **Sondy wejściowe (DArT_SNP.csv)** | 2008 | 2008 | Wyekstrahowane do probes.fa (69 nt) |
| **Mapowanie surowe (blast_raw.tsv)** | 2306 | 1984 | blastn (-max_target_seqs 1, evalue 1e-10) |
| **Po filtracji (blast_filtered.tsv)** | 1616 | 1543 | Kryteria: pident >= 96, length >= 68 |
| **Wybór najlepszych trafień (blast_best.tsv)** | 1543 | 1543 | Najwyższy bitscore (usunięcie duplikatów) |

## 3. Rozkład orientacji nici (dart_blast_filtered.tsv)
- Nić dodatnia (+): 810
- Nić ujemna (-): 733
- Łącznie: 1543 (~52.5% do 47.5%)

## 4. Ćwiczenie 3.3 – Zależność liczby sond od progu identyczności

| Próg identyczności | Liczba dopasowań (wierszy) | Liczba unikalnych sond |
| :---: | :---: | :---: |
| **90%** | 1665 | 1551 |
| **96%** | 1616 | 1543 |
| **99%** | 774 | 752 |

### Uzasadnienie wyboru progu 96%:
Sondy DArT mają długość 69 nukleotydów. Próg 96% dopuszcza do 2 niezgodności (~97.1% tożsamości). Jest to biologicznie optymalny kompromis: jedna niezgodność wynika z samego badanego polimorfizmu SNP, a druga dopuszcza drobną mutację odmianową lub błąd sekwencjonowania.
Próg 90% jest zbyt łagodny (dopuszcza 6–7 błędów), ryzykując fałszywe dopasowania do innych loci w zduplikowanym genomie łubinu. Z kolei próg 99% eliminuje ponad połowę markerów (spadek z 1543 do 752 sond), odrzucając sekwencje niosące allel alternatywny względem referencji Tanjil.
