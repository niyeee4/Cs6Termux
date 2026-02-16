# Adobe After Effects CS6 on Termux
# ✨ Features
- [x] Automatic installation of Adobe After Effects CS6 (Portable)
- [x] Automatic installation of QuickTime
- [x] Automatic plugin installation including:
- [x] RE VisionFX Effections Plus 21 (Twixtor,Rsmb)
- [x] BCC (10,9)
- [x] Sapphire 9
- [x] Magic Bullet Suite 12.1.5
- [x] Newton 2.2.11
- [x] Rowbyte
- [x] AEPixelSorter2
- [x] Ntsc Rs
- [x] PixelEncoder
# 📋 Requirements
- [Termux](https://github.com/termux/termux-app/releases/download/v0.118.3/termux-app_v0.118.3+github-debug_universal.apk)
- [Termux:X11-Extra](https://github.com/moio9/termux-x11-extra/releases/download/v1.0-rc1/app-universal-debug.apk)
## 🚀 Recommended specs (Snapdragon only):
- Snapdragon 8 Gen 1 or newer
- 8 GB RAM or more
- At least 10 GB free storage
> Older Snapdragon devices may still work
# Installation
- Run this command in Termux:
```bash
curl -sL https://raw.githubusercontent.com/niyeee4/Cs6Termux/refs/heads/main/ae.sh | bash
```
- Launch Adobe After Effects CS6 with:
```bash
Cs6
```
# Install Driver
- Type Cs6 in Termux
- Select option 3 (Install Driver)
- Select the driver to install:
- [x] Qualcomm805A7xx,A6xx.so
> For Adreno A7xx / A6xx GPUs
- [x] Qualcomm849A7xx.so
> For Adreno A7xx / maybe A6xx GPUs
- [x] v26.0.0R8A8xx.so
> For Adreno A8xx GPUs
- [x] v26.0.0R8A7xx.so
> For Adreno A7xx / maybe A6xx GPUs
- [x] v25.1.0R6.so
> For Adreno A7xx / A6xx GPUs
- ```Drivers directory: $HOME/Drivers```
# Credits
- Airidosas252 [Proton9arm64ec](https://github.com/airidosas252/tur/tree/master/tur/proton)
- K11MCH1 [Drivers](https://github.com/K11MCH1/AdrenoToolsDrivers)
