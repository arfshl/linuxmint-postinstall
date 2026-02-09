# Linux Mint Post-Install scripts

## Features
- One-click installation, Just copy-paste command on Terminal
- Automates installation of daily driver apps and Microsoft fonts
- Adding App Shortcut to Desktop for easy access
- Enable Firewall
- Enable [zram](https://wiki.archlinux.org/title/Zram)
- Setup DNS over TLS with systemd-resolved, using Cloudflare and Google DNS

## Auto-Installed Apps
- Google Chrome
- [OnlyOffice](https://www.onlyoffice.com/download-desktop.aspx) as Microsoft Office replacement, but you can still access Office Online or Google Workspaces via web browser
- VLC Media Player
- Spotify Linux Client
- GNOME Cheese (Camera App)
- GNOME Clocks
- Microsoft Corefonts (with `ttf-mscorefonts-installer` packages)

## Usage
Just copy-paste the commands to your terminal and execute. The script will automatically downloaded and executed

- Linux Mint Cinnamon, Linux Mint MATE, and Linux Mint Debian Edition

      wget https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/cinnamon.sh && sh cinnamon.sh && rm cinnamon.sh

- Linux Mint XFCE

      wget https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/xfce.sh && sh xfce.sh && rm xfce.sh

## All Debian-based distribution, but without shortcut to desktop

Works on:
- All Ubuntu and Debian flavor and desktop
- Zorin OS
- Pop! OS
- Linux Lite
- MX Linux [Enable systemd first!](https://mxlinux.org/wiki/system/systemd/)
- Elementary OS
- KDE Neon
- AnduinOS
- Q4OS
- And many more!

      wget https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/debian.sh && sh debian.sh && rm debian.sh

## Enable swap manually if not enabled by default (4GB is default size)

      sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

## VMware Tools

If you installing on VMware, use this command to install the drivers

      sudo apt install open-vm-tools-desktop -y

## Disable apt Pager at Debian 13 or Ubuntu 26.04

      echo 'Binary::apt::Pager "false";' | sudo tee -a  /etc/apt/apt.conf.d/99nopager
