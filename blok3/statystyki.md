Liczba sekwencji na każdym etapie:

| sonda wejściowa | 13573 |
| sonda z trafieniem | 2008 |
| trafienia po filtrze | 1616 |
| sondy po wyborze najlepszego | 1543 |
| rozkład orientacji | 810 (+), 733(-) |

Ćwiczenie 3.3
Użyte polecenie:
awk -F'\t' -v OFS='\t' '$3 >= x && $4 >= 68' blast_raw.tsv > blast_filtered.tsv
Liczba zachowań sond w zależności od progu identyczności: 

| x | wynik |
| 90 | 1665 |
| 96 | 1616 |
| 99 | 774 | 

Dla wartości 90 zostaną nam sekwencje niespecyficzne, o za małym dopasowaniu, o wyniku 1665, za to przy wartości 99 zostaną nam sekwencje bardzo dopasowane, bez żadnego buforu na m.in drobne błędy sekwencjonowania i będzie ich o około połowę mniej, czyli 774, niż przy wartościach 90 i 96. Wartość 96 jest optymalnym wyborem, zostaje 1616 sekwencji, bo pozwala na max 2 niezgodności na 69 pozycji i zostawia wystarczająco sekwencji do pracy. 
