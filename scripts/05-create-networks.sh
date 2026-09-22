#!/bin/bash

set -e

echo "===== SKYNET - CREACION DE REDES DOCKER ====="

echo
echo "[1/2] Creando skynet_public..."
if ! docker network inspect skynet_public > /dev/null 2>&1; then
    sudo docker network create skynet_public
else
    echo "skynet_public ya existe"
fi

echo
echo "[2/2] Creando skynet_private..."
if ! docker network inspect skynet_private > /dev/null 2>&1; then
    sudo docker network create --internal skynet_private
else
    echo "skynet_private ya existe"
fi

echo
echo "===== REDES DISPONIBLES ====="
sudo docker network ls

echo
echo "===== REDES SKYNET CREADAS CORRECTAMENTE ====="
