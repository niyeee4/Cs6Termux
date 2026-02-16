#!/data/data/com.termux/files/usr/bin/bash

set -e

cd ~
apt update -y
apt install git -y
git clone https://github.com/niyeee4/Cs6Termux
cd Cs6Termux
chmod +x installer.sh
sh installer.sh
