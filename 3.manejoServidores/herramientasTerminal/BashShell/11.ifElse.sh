#!/bin/bash
# Programa para ejemplificar el uso de la sentencia if, else
# Autor: Luis miguel Lara

notaClase=0
edad=0

echo "ejemplo sentencia if else"
read -n1 -p "cual es su nota (1-9):" notaclase
echo -e "\n"

if (( notaClase >= 7 )); then
    echo "aprueba la materia"
else
    echo "repruebas we"
fi

read -p "Indique su edad:" edad

if [ $edad -le 18 ]; then
    echo "No puedes votar we"
else 
    echo "puedes votar wero"
fi
