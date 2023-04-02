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
# Zadanie 3.
# Odnaleźć w katalogu `dane/pierwiastki/` wszystkie wiszące dowiązania miękkie
# – to jest takie, które wskazują na elementy nieistniejące w systemie plików.
# Wyświetlić nazwy plików ze znalezionymi dowiązaniami, każdą w osobnej linii.
# Nie wyświetlać nic ponadto!
#

# CZY JEST LEPSZY SPOSOB NIZ SED NA USUWANIE SCIEZKI?
# dodalem $DIR ale jednak chodzi o cos innego, bo to psuje dowiazanie lekkie od /etc/hosts

DIR="dane/pierwiastki/"

for VAR in "${DIR}"*; do 
    if [[ -L "${VAR}" ]]; then
        if [[ ! -f "$(readlink -f "${VAR}")" ]]; then
            basename "${VAR}"
        fi
    fi

    # Czemu to jest źle?
    #if [[ -L "${VAR}" ]]; then
    #    FILE=$(readlink -f "${VAR}")
    #    if [[ ! -e "${FILE}" ]]; then 
    #        basename "${VAR}"
    #    fi
    #fi
done;
