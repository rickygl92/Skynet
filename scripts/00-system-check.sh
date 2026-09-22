#!/bin/bash

echo "===== SKYNET SYSTEM CHECK ====="

echo
echo "[Sistema operativo]"
cat /etc/os-release

echo
echo "[Kernel]"
uname -r

echo
echo "[Arquitectura]"
dpkg --print-architecture

echo
echo "[Interfaces de red]"
ip -br address

echo
echo "[Rutas]"
ip route

echo
echo "[Hostname]"
hostname
