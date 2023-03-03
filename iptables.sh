#!/bin/bash

# INFORMACIÓN
# modo de ejecución: $ sudo iptables.sh

# define colors
fgRead="\e[31m"
fgGreen="\e[32m"
fgYellow="\e[33m"
fgBlue="\e[34m"
fgMagenta="\e[35m"
tsBold="\e[1m"
tsItalic="\e[3m"
tsUnderlined="\e[4m"
bgLigthBlue="\e[104m"
reset="\e[0m"

clear

# obtener interface
# interface=$(nmcli device | grep -i 'wifi' | awk '{print $1}' | head -1)

# crear una variable para guardad la interfaz
# obtener la interface de ethernet
interface=$(nmcli device | grep -i "ethernet" | cut -d ' ' -f1)
# interface="usb0"
echo -e "${tsBold}=== Setting iptables ==$reset"
echo -e "${tsItalic}*** Ethernet interface: $interface ***$reset"
echo -e "${tsBold}${fgGreen}Executing...$reset"
sleep 0.1


# limpiar reglas
iptables -F
iptables -t nat -F
echo -e "\tiptables -F"
echo -e "\tiptables -t nat -F"

# politicas por defecto
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
echo -e "\tiptables -P INPUT ACCEPT"
echo -e "\tiptables -P OUTPUT ACCEPT"
echo -e "\tiptables -P FORWARD ACCEPT"

# levantar adaptador
# Este paso es muy importante levantar de nuevo la red, porque si no fallara la conexión
ifconfig xenbr0 10.0.0.1
echo "ifconfig xenbr0 10.0.0.1"
# echo -e "\tifup xenbr0"
# ifup xenbr0 > /dev/null 2>&1


# habilitando el forward para ipv4
echo 1 > /proc/sys/net/ipv4/ip_forward
echo -e "\techo 1 > /proc/sys/net/ipv4/ip_forward"


# seteando las reglas
iptables -A FORWARD -i xenbr0 -j ACCEPT
iptables -t nat -A POSTROUTING -o $interface -j MASQUERADE
echo -e "\tiptables -A FORWARD -i xenbr0 -j ACCEPT"
echo -e "\tiptables -t nat -A POSTROUTING -o $interface -j MASQUERADE"

sleep 0.2
# show rules
echo -e "${tsBold}${fgGreen}Rules of iptables$reset"
echo "$(iptables -nL)"
