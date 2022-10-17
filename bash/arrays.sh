#!/usr/bin/env bash

declare -a distros=(ubuntu "linux mint" linux\ min2 debian)

echo "primera forma:"
for i in "${distros[@]}"
do
    echo $i
done

echo " "
echo "segunda forma:"
echo "${distros[@]:1:2}"

echo " "
echo "longitud: "
echo "${#distros[@]}"

nuevoarray=(manzana pera uva platano)
echo " "
echo "${nuevoarray[@]}"
echo ""
nuevoarray=(${nuevoarray[@]} sandia melon)
echo "${nuevoarray[@]}"

#eliminando arrays
echo""
unset nuevoarray
echo "${#nuevoarray[@]}"

