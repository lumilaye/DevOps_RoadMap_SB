#!/bin/bash
# Progranma que permite manejar las utilidades de postgres
# Autor Luis Miguel Lara

opcion=0

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "-----------------------------------------"
    echo "PGUTIL - Programa de utilidad de Postgres"
    echo "-----------------------------------------"
    echo "          Menu Principal                 "
    echo "1. Instalar Postgres"
    echo "2. Desintalar Postgres"
    echo "3. Sacar respaldo"
    echo "4. Restar respaldo"
    echo "5. Salir"

    # Leer los datos del usuario
    read -n1 -p "Ingrese una opcion:" opcion

    # Validar la opcion ingresada
    case $opcion in
        1)
            echo -e "\nInstalar Postgres..."
            sleep 3
            ;;
        2)
            echo -e "\nDesinstalar Postgres..."
            sleep 3
            ;;
        3)
            echo -e "\nSacar respaldo..."
            sleep 3
            ;;
        4)
            echo -e "\nRestaurar respaldo..."
            sleep 3
            ;;
        5)
            echo -e "\nSaliendo del programa..."
            exit 0
            ;;
    esac
done
