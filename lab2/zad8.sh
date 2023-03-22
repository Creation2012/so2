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
# Zadanie 8.
# Wyszukać w katalogu `dane/` i jego bezpośrednich podkatalogach (jeden poziom
# wgłąb) wszystkie pliki zwyczajne (nie katalogi!), które są w systemie plików
# oznaczone jako wykonywalne. Wyświetlić ścieżki do wszystkich znalezionych
# plików względem katalogu `dane/`. Każdą ścieżkę wyświetlić w osobnej linii.
#

DIR="dane/"

# znow cudzyslowia w lini 30
# linia 33 myłn z tym, ze directory ma spacje, więc samą zmienną trzeba otoczyć cudzysłowiem
# for plik in dane/* dane/*/*; do ...

for VAR in ${DIR}*; do 
    if [[ ! -d "${VAR}" ]]; then
        [[ -x "${VAR}" ]] && echo "${VAR}" | sed "s|${DIR}||"
    else
        for VARINNER in "${VAR}"/*; do 
            if [[ ! -d "${VARINNER}" && -x "${VARINNER}" ]]; then
                echo "${VARINNER}" | sed "s|${DIR}||"
            fi
        done
    fi
done
