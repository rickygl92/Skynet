#!/bin/bash

echo "=== VALIDACION DE CONFIGURACION ==="
sudo suricata -T -c /etc/suricata/suricata.yaml

echo
echo "=== ESTADO DEL SERVICIO ==="
sudo systemctl is-active suricata

echo
echo "=== INTERFACES ==="
ip -br -4 address

echo
echo "=== REGLAS LOCALES ==="
sudo cat /etc/suricata/rules/local.rules

echo
echo "=== ALERTAS SKYNET EN FAST.LOG ==="
sudo grep 'SKYNET' /var/log/suricata/fast.log | tail -n 20 || true

echo
echo "=== ALERTAS SKYNET EN EVE.JSON ==="
sudo grep 'SKYNET' /var/log/suricata/eve.json | tail -n 10 || true
