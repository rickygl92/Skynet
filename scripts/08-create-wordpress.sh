#!/bin/bash

set -e

cd ~/skynet-terminator-hunter

echo "===== SKYNET - CREACION DE WORDPRESS ====="

echo
echo "[1/5] Comprobando archivo .env..."
if [ ! -f .env ]; then
    echo "ERROR: No existe el archivo .env"
    exit 1
fi

echo
echo "[2/5] Comprobando MySQL..."
if ! sudo docker container inspect skynet_mysql > /dev/null 2>&1; then
    echo "ERROR: No existe el contenedor skynet_mysql"
    exit 1
fi

echo
echo "[3/5] Creando WordPress..."
if ! sudo docker container inspect skynet_wordpress > /dev/null 2>&1; then
    sudo docker create \
      --name skynet_wordpress \
      --network skynet_private \
      --env-file .env \
      -p 80:80 \
      -v skynet_wordpress_data:/var/www/html \
      --restart unless-stopped \
      wordpress:6.4-apache
else
    echo "skynet_wordpress ya existe"
fi

echo
echo "[4/5] Conectando WordPress a skynet_public..."
if ! sudo docker network inspect skynet_public \
    --format '{{json .Containers}}' | grep -q '"Name":"skynet_wordpress"'; then
    sudo docker network connect skynet_public skynet_wordpress
else
    echo "WordPress ya esta conectado a skynet_public"
fi

echo
echo "[5/5] Iniciando WordPress..."
sudo docker start skynet_wordpress > /dev/null

echo
echo "===== ESTADO DE CONTENEDORES ====="
sudo docker ps --filter name=skynet_

echo
echo "===== WORDPRESS CREADO CORRECTAMENTE ====="
