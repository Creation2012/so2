#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 7.
# Odnaleźć plik w katalogu `dane/kontrola/`, którego zawartość pokrywa się
# z wnętrzem pliku `dane/poszukiwany`. Jako wynik, wyświetlić wyłącznie nazwę
# pasującego pliku. Jeśli takiego pliku nie ma, nie wyświetlać zupełnie nic.
# Proszę pamiętać o każdorazowym upewnieniu się, że zawartość pliku możemy
# przeczytać (mamy prawo do odczytu – aby uniknąć błędów).
#

DIR1="dane/kontrola/"
DIR2="dane/poszukiwany"

#grep -qsi $(cat $DIR1/*) $DIR2/*
# "${VAR}" - rozjezdza wariant ze spacja Nickel Back
# nie tr bo on usuwa ze zbioru, a nie z pozycji
# bo slashe w variable DIR1 wiec trzeba zastapic w sed / na |

for VAR in $DIR1*; do 
    [[ -r ${VAR} ]] && grep -sq $(cat "${VAR}") $DIR2 && echo "${VAR}" | sed "s|${DIR1}||"
done
