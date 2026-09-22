#!/bin/bash

set -e

echo "===== SKYNET - VERIFICACION DE STACK ====="

echo
echo "[1/7] Contenedores activos..."
sudo docker ps

echo
echo "[2/7] Red skynet_public..."
sudo docker network inspect skynet_public \
  --format '{{range .Containers}}{{.Name}} {{end}}'

echo
echo "[3/7] Red skynet_private..."
sudo docker network inspect skynet_private \
  --format '{{range .Containers}}{{.Name}} {{end}}'

echo
echo "[4/7] Volumenes..."
sudo docker volume ls | grep skynet

echo
echo "[5/7] Puertos WordPress..."
sudo docker port skynet_wordpress

echo
echo "[6/7] Puertos MySQL..."
sudo docker port skynet_mysql || true

echo
echo "[7/7] Resolucion WordPress -> MySQL..."
sudo docker exec skynet_wordpress getent hosts skynet_mysql

echo
echo "[HTTP localhost]"
curl -I http://localhost

echo
echo "===== STACK SKYNET OPERATIVO ====="
