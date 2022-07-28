#!/bin/bash
# Programa para ejemplificar como capturar la informacion del usuario utilizando read 
# Realizado por Luis Miguel Lara


option=0
backupname=""

echo "Programa utilidades postgres"
read -p "Ingresar una opcion" option
read -p "Ingresar el nombre del archivo del backup" backupname
echo "Opcion: $option , backupname: $backupname"
