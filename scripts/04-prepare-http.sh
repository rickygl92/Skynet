#!/bin/bash

set -e

echo "===== SKYNET - PREPARACION SSH Y HTTP ====="

echo
echo "[1/4] Comprobando UFW..."
if ! command -v ufw > /dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y ufw
fi

echo
echo "[2/4] Permitiendo SSH - puerto 22..."
sudo ufw allow 22/tcp

echo
echo "[3/4] Permitiendo HTTP - puerto 80..."
sudo ufw allow 80/tcp

echo
echo "[4/4] Comprobando configuracion..."
sudo ufw status

echo
echo "[Puerto SSH]"
sudo ss -tlnp | grep ':22' || true

echo
echo "[Puerto HTTP]"
sudo ss -tlnp | grep ':80' || true

echo
echo "===== PREPARACION COMPLETADA ====="
