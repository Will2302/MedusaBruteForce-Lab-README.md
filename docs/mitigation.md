# 🛡️ Medidas de Mitigação

## 1. Fail2Ban (Bloqueio Automático)
```bash
# Instalar no target
sudo apt install fail2ban

# Configurar /etc/fail2ban/jail.local
[DEFAULT]
bantime = 3600
maxretry = 5

[vsftpd]
enabled = true
port = ftp,ftp-data
logpath = /var/log/vsftpd.log

[sshd]
enabled = true
```

## 2. Políticas de Senha Fortes
```bash
# /etc/security/pwquality.conf
minlen = 12
dcredit = -1
ucredit = -1
lcredit = -1
ocredit = -1
```

## 3. Rate Limiting (Apache/Nginx)
```apache
# .htaccess no DVWA
<Limit POST>
  # Max 10 requests/minuto por IP
  MaxConnPerIP 10
  CTMaxConnPerIP 10
</Limit>
```

## 4. 2FA com Google Authenticator
```bash
sudo apt install libpam-google-authenticator
google-authenticator
```

## 5. Monitoramento com Logwatch
```bash
sudo apt install logwatch
sudo logwatch --detail High --mailto admin@lab.local --service all
```

## ✅ Checklist de Defesa
- [ ] Fail2Ban ativo
- [ ] Senhas complexas
- [ ] Rate limiting
- [ ] 2FA habilitado
- [ ] Logs monitorados
- [ ] Firewall ufw ativo
