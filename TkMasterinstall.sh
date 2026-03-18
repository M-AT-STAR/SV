#!/bin/bash # Tk Master Baby Aight 🌬💙💨 @MastersTechSolutions IT'S ALL LOVE❤️OTF❤️.
clear

# --- SILENCED MINI SPINNER ---
spin() {
    local pid=$1
    local msg="$2"
    local chars="⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏"
    # Silenced tput
    tput civis 2>/dev/null || true
    while kill -0 $pid 2>/dev/null; do
        for c in $chars; do
            printf "\r\e[1;36m[%s] %s...\e[0m" "$c" "$msg"
            # Silenced sleep (prevents path leaks)
            sleep 0.1 2>/dev/null
        done
    done
    # Silenced tput
    tput cnorm 2>/dev/null || true
    printf "\r\e[1;32m[✔] %s... Done!\e[0m\e[K\n" "$msg"
}

echo -e "\e[1;34m===========================================\e[0m"
echo -e "\e[1;36m     MASTERS M@☆ SYSTEM INSTALLER          \e[0m"
echo -e "\e[1;36m     SECURED BY [MSPY] ENGINE              \e[0m"
echo -e "\e[1;34m===========================================\e[0m"
echo ""

# THE FIX: Animated pre-flight check for fresh Termux installs
if ! command -v openssl >/dev/null 2>&1; then
    (pkg update -y > /dev/null 2>&1 && pkg install -y openssl-tool > /dev/null 2>&1) &
    spin $! "Bootstrapping core decryptor"
fi

echo -e "\e[1;33m[+] Installing MASTERS SYSTEM M@☆ ...\e[0m"

_tmp=$(mktemp)

# Tk Master Baby Aight 🌬💙💨
curl -sL "https://raw.githubusercontent.com/M-AT-STAR/SV/main/lckd_nstll" | openssl aes-256-cbc -d -a -pbkdf2 -pass pass:2026 > "$_tmp" 2>/dev/null

if grep -q "Initializing" "$_tmp"; then
    echo -e "\e[1;32m[+] INSTALLATION SUCCESSFUL. Booting setup...\e[0m"
    sleep 1
    bash "$_tmp"
    rm -f "$_tmp"
else
    echo -e "\e[1;91m[!] INSTALLATION ERROR: DATA NOT FOUND.\e[0m"
    rm -f "$_tmp"
    exit 1
fi
