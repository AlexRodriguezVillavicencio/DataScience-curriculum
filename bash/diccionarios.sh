#!/bin/bash

declare -a vector
vector=('uno' 'dos' 'tres')
echo ${vector[@]}
echo ${#vector[@]}
echo ${!vector[@]}

echo "=============="

declare -A diccionario
diccionario[uno]='1'
diccionario[dos]='2'
diccionario[tres]='3'
echo ${diccionario[@]}
echo ${#diccionario[@]}
echo ${!diccionario[@]}

echo "================"
unset diccionario[dos]
unset diccionario['uno']
diccionario[cuatro]=4

for clave in "${!diccionario[@]}"
do
    valor="${diccionario[$clave]}"
    echo "el valor de la clave ${clave} es ${valor}"
done

