#!/bin/bash
set -e

cd "$(dirname "$0")/.."

echo "===== SKYNET - VERIFICACION DEL STACK ====="

echo; echo "[1/4] Servicios (compose)..."
sudo docker compose ps

echo; echo "[2/4] Red privada interna (MySQL sin salida)..."
sudo docker network inspect skynet_private -f 'internal={{.Internal}}'

echo; echo "[3/4] Resolucion WordPress -> MySQL..."
sudo docker compose exec -T wordpress getent hosts skynet_mysql

echo; echo "[4/4] Redireccion HTTP -> HTTPS..."
curl -sI http://localhost | head -n 1

echo; echo "===== STACK OPERATIVO ====="
