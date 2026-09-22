#!/bin/bash

set -e

cd ~/skynet-terminator-hunter

echo "===== SKYNET - CREACION DE MYSQL ====="

echo
echo "[1/4] Comprobando archivo .env..."
if [ ! -f .env ]; then
    echo "ERROR: No existe el archivo .env"
    exit 1
fi

echo
echo "[2/4] Comprobando red privada..."
if ! sudo docker network inspect skynet_private > /dev/null 2>&1; then
    echo "ERROR: No existe la red skynet_private"
    exit 1
fi

echo
echo "[3/4] Creando contenedor MySQL..."
if sudo docker container inspect skynet_mysql > /dev/null 2>&1; then
    echo "El contenedor skynet_mysql ya existe"
    sudo docker start skynet_mysql > /dev/null 2>&1 || true
else
    sudo docker run -d \
      --name skynet_mysql \
      --network skynet_private \
      --env-file .env \
      -v skynet_mysql_data:/var/lib/mysql \
      --restart unless-stopped \
      mysql:8.0
fi

echo
echo "[4/4] Estado del contenedor..."
sudo docker ps --filter name=skynet_mysql

echo
echo "===== MYSQL CREADO CORRECTAMENTE ====="
