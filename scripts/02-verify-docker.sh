#!/bin/bash

set -e

echo "===== SKYNET - VERIFICACION DE DOCKER ====="

echo
echo "[Docker version]"
docker --version

echo
echo "[Docker Compose version]"
docker compose version

echo
echo "[Estado del servicio Docker]"
sudo systemctl status docker --no-pager

echo
echo "[Prueba hello-world]"
sudo docker run --rm hello-world

echo
echo "===== DOCKER FUNCIONA CORRECTAMENTE ====="
