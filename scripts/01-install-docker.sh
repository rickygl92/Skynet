#!/bin/bash

set -e

echo "===== SKYNET - INSTALACION DE DOCKER ====="

echo
echo "[1/4] Actualizando indice de paquetes..."
sudo apt-get update

echo
echo "[2/4] Instalando Docker Engine..."
sudo apt-get install -y docker.io

echo
echo "[3/4] Instalando Docker Compose v2..."
sudo apt-get install -y docker-compose-v2

echo
echo "[4/4] Activando Docker..."
sudo systemctl enable --now docker

echo
echo "===== INSTALACION COMPLETADA ====="
docker --version
docker compose version
