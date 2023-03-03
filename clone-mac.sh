#!/bin/bash

interface=$(nmcli device | grep -i 'ethernet' | cut -d ' ' -f1)
macAddress=B0:22:7A:2F:80:83

echo "Configurando la interfaz: $interface"
echo "Clonando la mac address: $macAddress"

ifconfig $interface down
ifconfig $interface hw ether $macAddress
ifconfig $interface up

echo "Configurado exitosamente"
