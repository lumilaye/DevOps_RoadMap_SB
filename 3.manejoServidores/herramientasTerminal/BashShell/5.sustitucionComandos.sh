#!/bin/bash
# Programa para revisar como ejecutar comandos dentro d eun programa y almacenar en una variable 
# Realizado por Luis Miguel Lara

UBICACIONACTUAL=`pwd`
INFOKERNEL=$(uname -a)

echo "La ubicacion actual es: $UBICACIONACTUAL"
echo "Informacion del kernel: $INFOKERNEL"
