
# 📋 Guia de Setup Completo

## Pré-requisitos
- **VirtualBox** 7.x instalado
- **8GB RAM** livre (4GB por VM)
- **Kali Linux** ISO: [Download](https://www.kali.org/get-kali/)
- **Metasploitable 2** OVA: [SourceForge](https://sourceforge.net/projects/metasploitable/)

## 1. Configurar Rede Host-Only
```bash
# Terminal do Host (Windows/Linux/Mac)
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1 --netmask 255.255.255.0
```

## 2. Configurar VMs

### Kali Linux (Attacker)
