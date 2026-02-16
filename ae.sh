#!/data/data/com.termux/files/usr/bin/bash

set -e

cd ~
apt update -y
apt install git fontconfig -y
mkdir -p ~/.termux && curl -L -o ~/.termux/font.ttf "https://github.com/niyeee4/Cs6Termux/raw/refs/heads/main/font.ttf"
fc-cache -fv
git clone https://github.com/niyeee4/Cs6Termux
cd Cs6Termux
chmod +x installer.sh
sh installer.sh
