#!/bin/bash

# define colors
fgRead="\e[31m"
fgGreen="\e[32m"
fgYellow="\e[33m"
fgBlue="\e[34m"
fgMagenta="\e[35m"
tsBold="\e[1m"
tsUnderlined="\e[4m"
bgLigthBlue="\e[104m"
reset="\e[0m"

echo -ne "${tsBold}${tsUnderlined}${fgMagenta}interface of ethernet:${reset}";
interface=$(nmcli device | grep -i 'ethernet' | cut -d ' ' -f1)
echo -e " $bgLigthBlue$interface"