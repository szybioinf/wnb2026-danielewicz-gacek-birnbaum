# Walidacja pliku final.vcf (Blok 4)

## 1. Kontrole pośrednie (Ćwiczenia 4.1–4.3)
- **Ćwiczenie 4.1 (`dart_info_split.tsv`):** 0 wierszy niekompletnych (wszystkie wiersze mają 4 kolumny).
- **Ćwiczenie 4.2 (`dart_blast_with_genomic_snp.tsv`):** `poza zakresem: 0` (wszystkie wyliczone pozycje SNP mieszczą się w przedziale dopasowania BLAST).
- **Rozdział 13 (`dart_genotypes.tsv`):** 2009 wierszy (nagłówek + 2008 markerów), 95 kolumn (`ID` + 94 próbki). Rozkład genotypów (liczenie od końca wiersza): `0/0`: 96784, `1/1`: 76599, `0/1`: 12907, `./.`: 2462.
- **Ćwiczenie 4.3:** Odczyt kolumn od początku wiersza (`i=26`) zamiast od końca zaburza indeksowanie przez przecinki dziesiętne w kolumnach metadanych DArT, zwiększając liczbę wywołań `./.` z **2462** do **22555**.

## 2. Kontrole podstawowe `final.vcf` (Rozdział 15.1)
- Liczba linii nagłówkowych (`^##`): **4**
- Liczba wariantów (`^[^#]`): **1543**
- Liczba kolumn we wszystkich wierszach wariantów: **103** (9 stałych pól VCF + 94 próbki)
- Liczba zduplikowanych identyfikatorów (`ID`): **0**

## 3. Kontrola formalna i statystyki `bcftools` (Rozdział 15.2)
- `bcftools view final.vcf > /dev/null`: **Plik poprawny formalnie** (ostrzeżenia dotyczą wyłącznie braku linii `##contig` w nagłówku).
- `bcftools stats final.vcf`: 94 próbki, 1543 rekordy, 1543 SNPs, 0 indeli, 0 miejsc wieloallelicznych.
- Stosunek tranzycji do transwersji (`TSTV`): **ts = 971**, **tv = 572**, **ts/tv = 1.70** (mieści się w oczekiwanym zakresie 1.5–3).

## 4. Spójność z genomem referencyjnym i Ćwiczenie 4.4 (Rozdział 15.3)
*(Nazwy sekwencji w `regiony.txt` dopasowano do nagłówków `genome.fa.fai` przez usunięcie otoczki `gb|...|`).*
- **Po korekcie nici minus (`step2_core_rc.tsv`):**
  - `genom == DArT REF`: **367**
  - `genom == DArT ALT`: **338**
  - `poza {REF, ALT}`: **838**
  - Spójnych (`REF` lub `ALT`): **45.7%**
- **Przed korektą nici minus (`step1_core.tsv` – Ćwiczenie 4.4):**
  - `genom == DArT REF`: **404**
  - `genom == DArT ALT`: **376**
  - `poza {REF, ALT}`: **763**
  - Spójnych (`REF` lub `ALT`): **50.6%**
- **Wniosek:** Odsetek spójności ~45.7% wynika z przesunięcia pozycji SNP o 1 nukleotyd (adnotacje DArT są indeksowane od 0, podczas gdy wzór z Rozdziału 7 przyjmuje indeksowanie od 1).
