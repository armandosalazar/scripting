#!/bin/bash

cadena=7
numero=$((7))
numero=$(expr 7)
resultado=$cadena-$numero # 7-7
resultado=$(expr $cadena - $numero)
resultado=$(($cadena - $numero))
resultado=$((cadena - numero + 7))
echo $resultado
