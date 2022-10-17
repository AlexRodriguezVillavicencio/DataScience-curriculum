#!usr/bin/env bash

if [ "$1" = "hola" ]
then
    echo "$1 mundo"
elif [ "$1" = "mundo" ]
then
    echo "hola"
elif [ ! -z "$1" ]
then
    echo "variable no valida"
else
    echo "no has pasado ningún parámetro"
fi
