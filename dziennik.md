# Dziennik projektu WNB 2026

## Blok 1: Srodowisko pracy i kontrola wersji
W ramach bloku 1 skonfigurowalismy srodowisko pracy oparte o maszyne wirtualna z systemem Linux oraz narzedzia powloki Bash. Skonfigurowalismy klucze SSH i repozytorium na platformie GitHub wraz z zasadami ochrony galezi main. Przetestowalismy przeplyw pracy w zespole oparty o galezie funkcyjne, Pull Requesty oraz proces wzajemnej recenzji kodu (Code Review).

## Blok 2:
W bloku 2 połączyliśmy się z sererem obliczeniowym. Na klastrze wykonujemy obliczenia, których nie można wykonać na komputerze przenośnym. Mamy własne środowisko conda, którego używamy do przetwarzania tekstu, oraz samodzielnie stworzony plik w awk w formacie FASTA, z sondami DArT.

## Blok 3:
Wykonano:
1. Odnalezienie w NCBI, pobranie i przygotowanie do mapowania genomu referencyjnego.
2. Wyodrębnienie pliki probes.fa oraz dart_info_oline.tsv z danych DarT.
3. Indeksowanie i mapowanie BLAST
4. Przefiltrowanie wyników i pozbycie się powtórzeń, wybranie dla każdej sondy jednego dopasowania o najwyższej wartości.
5. Określono orientacje nici.
