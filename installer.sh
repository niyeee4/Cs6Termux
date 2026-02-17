#!/data/data/com.termux/files/usr/bin/bash

set -e  # Exit immediately if any command fails
rm -f $PREFIX/etc/tls/openssl.cnf
rm -f $PREFIX/etc/bash.bashrc
echo "Installing Packages"
# Function to check if a command succeeds
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting..."
        exit 1
    fi
}

apt update -y && apt upgrade -y || check_success "APT update & upgrade"
termux-setup-storage || check_success "Storage setup"

# Install necessary dependencies
yes | apt install -y x11-repo || check_success "Installing x11-repo"
yes | apt install -y termux-x11-nightly libandroid-shmem || check_success "Installing required packages"
yes | apt install -y pv unzip wget git which libc++ libdrm libx11 libxcb libxshmfence libwayland vulkan-loader-generic zlib zstd || check_success "Installing required packages"
# Install hangover-wine to pull dependencies, then remove it
apt install -y hangover-wine || check_success "Installing hangover-wine"
apt remove -y hangover-wine || check_success "Removing hangover-wine (dependencies retained)"

# Install Proton package
dpkg -i proton_9.0-3_aarch64.deb || check_success "Installing Proton package"

# Copy necessary files
echo "Installing JeezDisReez wrapper with AdrenoTools installed..."
mkdir -p "$PREFIX/drivers"
mkdir -p "$PREFIX/share/vulkan/icd.d/"
cp wrapper/* $PREFIX/lib || check_success "Copying wrapper libraries"
cp wrapper_icd.aarch64.json $PREFIX/share/vulkan/icd.d/ || check_success "Copying wrapper icd file"
echo "Installing FEX DLLs..."
cp lib* $PREFIX/opt/proton-wine/lib/wine/aarch64-windows/ || check_success "Copying libraries"
cp Cs6 $PREFIX/bin/ || check_success "Copying Cs6 script"
cp dxvk.conf $HOME/ || check_success "Copying dxvk.conf"
mkdir -p $HOME/.fex-emu
cp Config.json $HOME/.fex-emu
chmod +x $PREFIX/bin/Cs6 || check_success "Making Cs6 script executable"

echo "Creating symlinks..."
ln -sf $PREFIX/opt/proton-wine/bin/wine $PREFIX/bin/wine
ln -sf $PREFIX/opt/proton-wine/bin/wineserver $PREFIX/bin/wineserver
ln -sf $PREFIX/opt/proton-wine/bin/winecfg $PREFIX/bin/winecfg
ln -sf $PREFIX/opt/proton-wine/bin/wineboot $PREFIX/bin/wineboot
ln -s $PREFIX/bin/Cs6 $PREFIX/bin/cs6
ln -s $PREFIX/bin/Cs6 $PREFIX/bin/CS6

echo "Building Wine prefix..."
sleep 1
DISPLAY=:1 WINE_DISABLE_KERNEL_WRITEWATCH=1 WINEFSYNC=0 wineboot || check_success "Initializing Wine prefix"
pkill -f com.termux.x11 || true  # Ignore error

echo "Setting DXVK overrides..."
for dll in dxgi d3d9 d3d10 d3d10core d3d10_1 d3d11 d3d12 d3d12core; do
    WINE_DISABLE_KERNEL_WRITEWATCH=1 WINEFSYNC=0 wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "$dll" /t REG_SZ /d "native,builtin" /f
done

echo "Installing After Effects Cs6"
rm -rf $HOME/.wine/drive_c
cd ~/.wine
wget -O - https://github.com/niyeee4/Cs6Termux/releases/download/Cs6/drive_c_backup.tar.xz | pv | tar -xJf -
sleep 1
# Create drive mappings
ln -sfT /sdcard/Download $HOME/.wine/dosdevices/e:
ln -sfT /sdcard $HOME/.wine/dosdevices/d:
# Drivers
cp -r $HOME/Cs6Termux/Drivers $HOME/
mkdir -p /data/data/com.termux/files/usr/drivers && cp "$HOME/Drivers/v25.1.0R6.so" /data/data/com.termux/files/usr/drivers/vulkan.adreno.so
cd ~
rm -rf Cs6Termux
clear
echo "Enter Cs6 To Run After Effects"
