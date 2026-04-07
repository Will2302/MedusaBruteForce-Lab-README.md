#!/bin/bash
TARGET="192.168.56.20"
echo "🔍 Enumerando usuários SMB..."
nmap -p 445 --script smb-enum-users $TARGET -oN enum-results.txt
cat enum-results.txt | grep "Discovered"
