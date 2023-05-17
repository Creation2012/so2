#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 6
#
# Celem zajęć jest zapoznanie się z możliwościami narzędzia awk.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego wywołania
# programu `awk` z odpowiednimi argumentami.
#

#
# Zadanie 9.
# Przy pomocy programu awk, przeczytać zawartość pliku `dodatkowe/nowomowa.txt`
# i wyznaczyć statystykę dotyczącą długości obecnych tam słów – czyli policzyć
# ile jest słów o długości jednego znaku, dwóch znaków, trzech znaków, itd.
# Jako wynik wyświetlić długość słów w znakach i liczbę ich wystąpień,
# każdą taką parę w osobnej linii. W obliczeniach pomijamy przecinki i kropki
# – proszę zwrócić uwagę, że niektóre słowa zawierają je na końcu i odpowiednio
# uwzględnić taką sytuację.
#

FILE="dodatkowe/nowomowa.txt"

#awk 'BEGIN { RS = " "} { if(substr($0,length,1) == "," || substr($0,length,1) == ".") printf substr($0,0,length-1)"\n"; else if(substr($0,length,1) == "\n") printf substr($0,0,length-2)"\n"; else printf $0"\n" }' "${FILE}"
# print daje inny wyniki niz printf przy length?
#awk '{ RS = " " } { gsub(",",""); gsub("\\.",""); gsub("\n"," "); lens[length]++ } END { for (i in lens) { printf i " " lens[i] "\n" } }' "${FILE}" | sort
# ZWYKŁE RS = " " NIE DZIAŁA
# [[:space:]]+ - any sequence of whitespace characters
awk 'BEGIN { RS="[[:space:]]+" } { gsub("\\.",""); gsub(",",""); arr[length()]++ } END { for (i in arr) { printf i" "arr[i]"\n" } }' dodatkowe/nowomowa.txt | sort
#awk '{for(i=1;i<=NF;i++) { gsub(/[\.,]/,"",$i); arr[length($i)]++ }} END { for (i in arr) { print i, arr[i] } }' dodatkowe/nowomowa.txt | sort
