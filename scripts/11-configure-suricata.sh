#!/bin/bash
set -e

CONFIG="/etc/suricata/suricata.yaml"
RULES="/etc/suricata/rules/local.rules"

IFACE=$(ip route | awk '/default/ {print $5; exit}')

if [ -z "$IFACE" ]; then
    echo "ERROR: no se pudo detectar la interfaz de red"
    exit 1
fi

echo "[+] Interfaz detectada: $IFACE"

sudo cp -n "$CONFIG" "$CONFIG.bak" || true

sudo sed -i \
's|^    HOME_NET:.*|    HOME_NET: "[192.168.0.0/16,10.0.0.0/8,172.16.0.0/12]"|' \
"$CONFIG"

sudo sed -i \
"0,/interface: /s/interface: .*/interface: $IFACE/" \
"$CONFIG"

sudo sed -i \
's|^  - suricata.rules$|  - local.rules|' \
"$CONFIG"

sudo mkdir -p /etc/suricata/rules

sudo tee "$RULES" > /dev/null <<'EOF'
alert icmp any any -> any any (msg:"SKYNET - ICMP DETECTADO"; sid:1000003; rev:1;)
alert tcp any any -> $HOME_NET any (msg:"SKYNET - TCP SYN DETECTADO"; flags:S; sid:1000002; rev:1;)
EOF

sudo suricata -T -c "$CONFIG"

sudo systemctl reset-failed suricata
sudo systemctl restart suricata

sudo systemctl is-active suricata

echo "[+] Suricata configurado correctamente"
