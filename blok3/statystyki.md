Liczba sekwencji na każdym etapie:

| Etap | Liczba |
| :--- | :--- |
| sondy wejściowe | 2008 |
| sondy z trafieniem | 1984 |
| trafienia po filtrze | 1601 |
| sondy po wyborze najlepszego | 1543 |
| rozkład orientacji | 780 (+), 763 (-) |

Spadek liczby sond z 2008 do 1543 wynika z faktu, że część sond nie zmapowała się nigdzie (np. z powodu brakujących regionów w złożeniu genomu), a część została odrzucona na etapie filtrowania (`pident >= 96`, `length >= 68`) jako krótkie lub niespecyficzne dopasowania[cite: 9, 10].

Ćwiczenie 3.3
Użyte polecenie:
`awk -F'\t' -v OFS='\t' '$3 >= x && $4 >= 68' blast_raw.tsv > blast_filtered.tsv`

Liczba zachowań sond w zależności od progu identyczności:

| x | wynik (trafienia) | unikalne sondy |
| :--- | :--- | :--- |
| 90 | 1833 | 1724 |
| 96 | 1601 | 1543 |
| 99 | 1272 | 1244 |

Dla wartości 90 zostaje dużo niespecyficznych dopasowań (dopuszcza aż do 7 niezgodności na 69 nt), przez co sondy mogą trafiać w inne, podobne miejsca w genomie. Z kolei przy progu 99 wymuszamy praktycznie brak niezgodności — nie ma żadnego bufora na sam polimorfizm SNP ani drobne błędy sekwencjonowania i odrzucamy za dużo dobrych markerów. Wartość 96 jest optymalnym wyborem (zostaje 1601 trafień i 1543 unikalne sondy), ponieważ pozwala na maksymalnie 2 niezgodności na 69 pozycji (w tym miejsce samego SNP) i daje pewny zestaw markerów do dalszej analizy.
