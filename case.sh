#!/bin/bash

echo "[ Escriba una frase ]"
read frase

case $frase in
    a*)
        echo "La frase empieza con a";;
    c*t)
        echo "La frase empieza con c y termina con t"
        ;;
    *)
        echo "La frase no comple con ninguna de las condiciones"
        ;;
esac
