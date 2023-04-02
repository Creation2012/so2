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
# Zadanie 9.
# Odszukać w katalogu `dane/` i jego bezpośrednich podkatalogach (uwzględnić
# tylko jeden poziom wgłąb) wszystkie wiszące dowiązania miękkie i podjąć próbę
# ich naprawy – zakładamy, że nazwy wskazywanych przez nie plików są poprawne,
# ale doszło do jakiegoś zamieszania w strukturze katalogów. Należy odszukać
# pasujących plików zwykłych, a jeśli takie istnieją – wyświetlić nazwę
# dowiązania, dwukropek i po spacji: najkrótszą poprawną ścieżkę względną
# do niego od istniejącego dowiązania (na przykład: bravo: ../icao/bravo).
#

DIR="dane/"

# dwie gwiazki zdupczyły

#WERSJA 1
#for VAR in "${DIR}"* "${DIR}"*/*; do 
#    if [[ -L "${VAR}" ]];  then
#        if [[ ! -e "$(dirname "${VAR}")"/"$(readlink "${VAR}")" ]]; then
#            echo "${VAR}"
#        fi
#    fi
#    for VAR_IN in "${DIR}"*/*; do 
#        :
#    done;
#done;

#WERSJA 2
#for VAR in "${DIR}"**/* "${DIR}"*; do 
#    if [[ -L "${VAR}" ]];  then
#        LINK=$(readlink "${VAR}")
#        for VAR_IN in "${DIR}"**/* "${DIR}"*; do 
#            if [[ "$(basename "${VAR_IN}")" == "$(basename "${LINK}")" ]]; then
#               if [[ -f "${VAR_IN}" ]]; then
#                    echo "${LINK}"
#               fi
#            fi
#        done;
#    fi
#done;

#shopt -s globstar
#shopt -s dotglob 

# -f :)))))))
#WERSJA 3
for VAR in "${DIR}"* "${DIR}"*/*; do
    if [[ -L "${VAR}" ]]; then
        TARGET="$(readlink "${VAR}")"
        if [[ ! -f "${TARGET}" ]]; then 
            if [[ ! -L "${TARGET}" ]]; then
                echo "1:$(basename "${VAR}") 2:"${VAR}" 3:"${TARGET}" "
            fi
        else
            if [[ ! -L "${TARGET}" ]]; then
                echo "1:$(basename "${VAR}") 2:"${VAR}" 3:"${TARGET}" "
            fi
        fi
        #realpath --relative-to="${VAR}" "${TARGET}"
        #echo "==="
    fi
    #for VAR_IN in "${DIR}"* "${DIR}"**/*; do
    #    if [[ "$(basename "${VAR_IN}")" == "${target}" ]]; then
    #        echo "$(basename "${VAR_IN}")": "$(realpath --relative-to="$(dirname "$symlink")" "${target}")"
    #        break
    #    fi
    #done;
    #if [[ -e "$target" ]]; then
    #  # the symlink target exists, try to fix it
    #  new_path=$(realpath --relative-to="$(dirname "$symlink")" "$target")
    #  echo "$(basename "$symlink"): $new_path"
    #fi
done

#WERSJA 4
#for VAR in "${DIR}"* "${DIR}"*/*; do 
#    if [[ -L "${VAR}" ]];  then
#        if [[ ! -e "$(readlink "${VAR}")" ]]; then
#            echo "${VAR}"
#        else
#              :
#        fi
#    fi
##    for VAR_IN in "${DIR}"*/*; do 
##        :
##    done;
#done;
#
#WERSJA 5

#shopt -s nullglob

#for symlink in "${DIR}"* "${DIR}"*/; do
#  if [[ -h "$symlink" ]]; then
#    target=$(readlink "$symlink")
#    if [[ ! -e "$target" ]]; then
#      # the symlink target doesn't exist, try to fix it
#      for file in "${DIR}"* "${DIR}"*/; do
#        if [[ -f "$file" && "$(basename "$file")" == "$(basename "$target")" ]]; then
#          # found a matching file, fix the symlink
#          new_path=$(realpath --relative-to="$(dirname "$symlink")" "$file")
#          echo "$(basename "$symlink"): $new_path"
#          break
#        fi
#      done
#    fi
#  fi
#done
