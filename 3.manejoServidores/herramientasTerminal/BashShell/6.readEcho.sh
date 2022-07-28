#!/bin/bash
# Programa para ejemplificar como capturar la informacion del usuario utilizando echo y read 
# Realizado por Luis Miguel Lara


option=0
backupname=""

echo "Programa utilidades postgres"
echo -n"Ingresar una opcion"
read
option=$REPLY
echo -n"Ingresar el nombre del archivo del backup"
read
backupname=$REPLY
echo "Opcion: $option , backupname: $backupname"
