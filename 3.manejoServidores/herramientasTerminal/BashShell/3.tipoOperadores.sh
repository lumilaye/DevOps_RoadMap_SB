#!/bin/bash
# Programa para revisar el tipo de operadores 
# Realizado por Luis Miguel Lara

NUMA=10
NUMB=4

echo "Operadores aritmeticos"

echo "Numero A $NUMA y Numero B $NUMB"

echo "Sumar el numero A + el numero b: "
echo "A + B = $((NUMA+NUMB))"
echo "A - B = $((NUMA-NUMB))"
echo "A * B = $((NUMA*NUMB))"
echo "A / B = $((NUMA/NUMB))"

echo -e "\nOperadores relacionales"
echo "Numero A $NUMA y Numero B $NUMB"
echo "Sumar el numero A + el numero b: "
echo "A > B = $((NUMA>NUMB))"
echo "A < B = $((NUMA<NUMB))"

