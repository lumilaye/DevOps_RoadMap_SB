#!/bin/bash
# Programa para revisar la declaracion de variables

opcion=1
nombre=larita

echo "Opcion:$opcion y Nombre: $nombre "

# Exportar la variable nombre para que este disponible a los demas procesos

export nombre

# Llamar al siguiente script

./2.variables_2.sh
