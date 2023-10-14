#!/bin/bash

# Obtenemos la dirección IP del host
echo -n "Introduce la dirección IP: "
read IP

# Realizamos un ping al host y verificamos si el host es accesible
if ping -c 1 $IP > /dev/null 2>&1; then

# Obtenemos el valor del TTL
TTL=$(ping -c 1 localhost | grep "ttl=" | awk '{print $7}' | tr -d "ttl=")

echo $TTL

# Analizamos el valor del TTL para determinar el sistema operativo
if [ $TTL -gt 60 ] && [ $TTL -lt 100 ]; then
  echo "El sistema operativo es Linux/Unix"
elif [ $TTL -gt 100 ] && [ $TTL -lt 170 ]; then
  echo "El sistema operativo es Windows"
else
  echo "No se puede determinar el sistema operativo con certeza"
fi

else
  echo "El host no es accesible"
fi

