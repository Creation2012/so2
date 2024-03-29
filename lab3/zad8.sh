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
# Zadanie 8.
# Opracować narzędzie do niby-synchronizacji plików pomiędzy dwoma katalogami
# – `dane/elements/` (L) oraz `dane/pierwiastki/` (P). Każdy plik zwykły
# (pomijamy dowiązania miękkie) powinien mieć swój odpowiednik o tej samej
# nazwie w drugim katalogu (przy czym odpowiednik może być dowolnego typu,
# nie sprawdzamy również jego zawartości). Jako wynik działania skryptu proszę
# zwrócić informację o brakujących plikach w poszczególnych katalogach,
# podając nazwy plików, poprzedzone indeksem L lub P i znakiem dwukropka,
# każdy wpis w osobnej linii (na przykład: L:Oxygen – indeks mówi, w którym
# katalogu powinien znaleźć się dany plik).
#

L="dane/elements/"
P="dane/pierwiastki/"

function synchronize()
{
    SIDE="${3}"
    for VAR in "${1}"*; do 
        if [[ ! -L "${VAR}" ]]; then
            if [[ ! -f "${2}$(basename "${VAR}")" && ! -L "${2}$(basename "${VAR}")" ]]; then
                # takie cus (${!1@})
                echo "${SIDE}:$(basename "${VAR}")"
            fi
        fi
    done;

    return 0
}

synchronize "${P}" "${L}" "L"
synchronize "${L}" "${P}" "P"

#for VARL in "${L}"*; do 
#    if [[ ! -L "${VARL}" ]]; then
#        if [[ ! -f "$R$(basename "${VARL}")" && ! -L "$R$(basename "${VARL}")" ]]; then
#            echo "L:$(basename ${VARL})"
#        fi
#    fi
#done;
#for VARR in "${R}"*; do 
#    echo "${VARL}" "${VARR}"
#done;
