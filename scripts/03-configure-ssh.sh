#!/bin/bash

set -e

echo "===== SKYNET - CONFIGURACION SSH ====="

echo
echo "[1/5] Comprobando OpenSSH Server..."
if ! dpkg -s openssh-server > /dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y openssh-server
fi

echo
echo "[2/5] Creando copia de seguridad..."
if [ ! -f /etc/ssh/sshd_config.bak ]; then
    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
fi

echo
echo "[3/5] Aplicando configuracion SKYNET..."
sudo tee /etc/ssh/sshd_config.d/99-skynet.conf > /dev/null <<EOFSSH
Port 22
PermitRootLogin no
PasswordAuthentication yes
PubkeyAuthentication yes
EOFSSH

echo
echo "[4/5] Validando configuracion..."
sudo /usr/sbin/sshd -t

echo
echo "[5/5] Activando servicio..."
sudo systemctl enable --now ssh
sudo systemctl reload ssh

echo
echo "===== ESTADO SSH ====="
sudo systemctl is-active ssh
sudo ss -tlnp | grep ':22'

echo
echo "===== SSH CONFIGURADO CORRECTAMENTE ====="
