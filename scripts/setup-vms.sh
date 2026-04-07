#!/bin/bash
echo "🛠️ Configurando VMs..."

# Verificar conectividade
TARGET="192.168.56.20"
if ping -c 1 $TARGET &> /dev/null; then
    echo "✅ Target online: $TARGET"
    nmap -sV -p 21,80,445 $TARGET
else
    echo "❌ Target offline. Verifique rede Host-Only."
    exit 1
fi

echo "🎉 Setup completo! Execute: ./scripts/brute-attack.sh"
