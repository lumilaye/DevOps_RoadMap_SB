#!/bin/bash
# Programa para ejemplificar el paso de argumentos 
# Realizado por Luis Miguel Lara

NOMBRECURSO=$1
HORARIOCURSO=$2

echo "El nombre del curso es: $NOMBRECURSO dictado en el horario: $HORARIOCURSO"

echo "El numero de parametros enviados es: $#"

echo "Los parametros enviados son: $*"
echo "Los parametros enviados son: $@"
