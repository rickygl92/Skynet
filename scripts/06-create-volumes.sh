#!/bin/bash

set -e

echo "===== SKYNET - CREACION DE VOLUMENES DOCKER ====="

echo
echo "[1/2] Creando skynet_mysql_data..."
if ! docker volume inspect skynet_mysql_data > /dev/null 2>&1; then
    sudo docker volume create skynet_mysql_data
else
    echo "skynet_mysql_data ya existe"
fi

echo
echo "[2/2] Creando skynet_wordpress_data..."
if ! docker volume inspect skynet_wordpress_data > /dev/null 2>&1; then
    sudo docker volume create skynet_wordpress_data
else
    echo "skynet_wordpress_data ya existe"
fi

echo
echo "===== VOLUMENES DISPONIBLES ====="
sudo docker volume ls

echo
echo "===== VOLUMENES SKYNET CREADOS CORRECTAMENTE ====="
