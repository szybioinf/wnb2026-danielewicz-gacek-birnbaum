# walidacja blok 4

| kontrola | wynik | opis |
| :--- | :--- | :--- |
| wiersze nagłówkowe (`^##`) | 4 | nagłówek zgodny z vcf 4.2 |
| liczba wariantów | 1543 | wszystkie markery przeszły do pliku wynikowego |
| liczba kolumn | 103 | 9 kolumn vcf + 94 próbki |
| powtórzone identyfikatory | 0 | brak duplikatów |
| spójność z genomem (15.3) | REF: 367, ALT: 338, poza: 838 (45.7%) | niższy odsetek przez dopasowania do transkryptów (`lcl|...`), których nie ma w `genome.fa` |
