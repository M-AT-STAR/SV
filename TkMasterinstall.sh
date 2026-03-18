#!/bin/bash
clear
echo -e "\e[1;34m===========================================\e[0m"
echo -e "\e[1;36m      M@☆ SYSTEM INSTALLER LOCKED          \e[0m"
echo -e "\e[1;34m===========================================\e[0m"
echo ""
read -s -p $'\e[1;33mEnter VIP Install PIN: \e[0m' PIN
echo ""

# Silently pull the locked payload from GitHub and decrypt it into RAM
DECRYPTED=$(curl -sL "https://raw.githubusercontent.com/M-AT-STAR/SV/main/lckd_nstll" | openssl aes-256-cbc -d -a -pbkdf2 -pass pass:"$PIN" 2>/dev/null)

if [ -z "$DECRYPTED" ]; then
    echo -e "\e[1;91m[!] INVALID PIN. SELF-DESTRUCTING PROCESS.\e[0m"
    exit 1
else
    echo -e "\e[1;32m[+] PIN Accepted. Initializing M@☆ setup...\e[0m"
    sleep 1
    eval "$DECRYPTED"
fi

