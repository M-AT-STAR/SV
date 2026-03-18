#!/bin/bash
clear
echo -e "\e[1;34m===========================================\e[0m"
echo -e "\e[1;36m     MASTERS M@☆ SYSTEM INSTALLER          \e[0m"
echo -e "\e[1;36m     SECURED BY [MSPY] PIN:2026          \e[0m"
echo -e "\e[1;34m===========================================\e[0m"
echo ""

# THE FIX: </dev/tty forces it to listen to the keyboard instead of the curl pipe!
read -s -p $'\e[1;33mEnter Install PIN: \e[0m' PIN </dev/tty
echo ""

_tmp=$(mktemp)
curl -sL "https://raw.githubusercontent.com/M-AT-STAR/SV/main/lckd_nstll" | openssl aes-256-cbc -d -a -pbkdf2 -pass pass:"$PIN" > "$_tmp" 2>/dev/null

if grep -q "Initializing" "$_tmp"; then
    echo -e "\e[1;32m[+] PIN Accepted. Initializing M@☆ setup...\e[0m"
    sleep 1
    bash "$_tmp"
    rm -f "$_tmp"
else
    echo -e "\e[1;91m[!] INVALID PIN OR CORRUPT PAYLOAD. SELF-DESTRUCTING PROCESS.\e[0m"
    rm -f "$_tmp"
    exit 1
fi

