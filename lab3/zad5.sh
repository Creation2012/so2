#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
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
# Zadanie 5.
# Plik `dane/twardziel` stanowi dowiązanie twarde do pewnych plików z katalogu
# `dane/icao/`. Proszę odnaleźć które to pliki i wyświetlić ich nazwy, każdą
# w osobnej linii.
#

FILE="dane/twardziel"
DIR="dane/icao/"

INODE_MATCH="$(basename "$(ls -i $FILE | awk '{ print $1 }')")"

for VAR in "${DIR}"*; do
    INODE_FOUND=$(ls -i "${VAR}" | awk '{ print $1 }')
    if [[ "${INODE_FOUND}" == "${INODE_MATCH}" ]]; then
        echo "$(basename "${VAR}")"
    fi
done
