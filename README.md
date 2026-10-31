# Linux Mint Post-Install scripts
Post-install script for Linux Mint and Debian/Ubuntu based distro. My recommendation for both home and education usage replacing Windows

Looks for [Windows version](https://github.com/arfshl/windows-postinstall)?

## Features
- One-click installation, Just copy-paste command on Terminal
- Automates installation of daily-usage apps and Microsoft fonts
- Adding App Shortcut to Desktop for easy access (Linux Mint only)
- Enable Firewall (Block incoming connection by default)
- Enable [zram](https://wiki.archlinux.org/title/Zram) with `zstd` compression
- Setup DNS over TLS with systemd-resolved, using Cloudflare and ControlD Unfiltered

## Pre-Installed Apps
- Google Chrome
- [OnlyOffice](https://www.onlyoffice.com/download-desktop.aspx) as Microsoft Office replacement, but you can still access Office Online or Google Workspaces via web browser
- VLC Media Player
- Spotify Linux Client
- GNOME Cheese/Kamoso (Camera App)
- GNOME Clocks/KClock (Clock App)
- Microsoft Corefonts (with `ttf-mscorefonts-installer` packages)
- Flatpak and GNOME Software/KDE Discover (Script for Ubuntu flavor with Nosnap will get their snapd replaced with flatpak)
- software-properties-common and software-properties-gtk (Ubuntu only)
- Winbind for Active Directory

## Usage
Just copy-paste the commands to your terminal and execute. The script will automatically downloaded and executed

- Linux Mint Cinnamon, Linux Mint MATE, and Linux Mint Debian Edition

      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/linuxmint/cinnamon.sh | sudo bash
  
- Linux Mint XFCE

      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/linuxmint/xfce.sh | sudo bash

- Ubuntu Flavor with GTK (Ubuntu, Xubuntu, Ubuntu MATE, Cinnamon, Budgie, Unity)

      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/ubuntu/ubuntu.sh | sudo bash

- Ubuntu Flavor with GTK (Ubuntu, Xubuntu, Ubuntu MATE, Cinnamon, Budgie, Unity) Nosnap

      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/ubuntu/ubuntu-nosnap.sh | sudo bash

- Ubuntu Flavor with Qt (Kubuntu, Lubuntu, KDE Neon)

      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/ubuntu/kubuntu.sh | sudo bash

- Ubuntu Flavor with Qt (Kubuntu, Lubuntu, KDE Neon) Nosnap

      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/ubuntu/kubuntu-nosnap.sh | sudo bash

#### Other Ubuntu/Debian-based distribution with GTK
- Debian GNOME, XFCE, Cinnamon, LXDE
- Zorin OS
- Pop! OS
- Linux Lite
- MX Linux [Enable systemd first!](https://mxlinux.org/wiki/system/systemd)
- Elementary OS
- AnduinOS
  
      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/debian/debian-gtk.sh | sudo bash

#### Other Ubuntu/Debian-based distribution with Qt 
- Debian KDE, LXQt
- Q4OS

      curl -fssL https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/debian/debian-qt.sh | sudo bash

## Enable swap manually if not enabled by default (4GB is default size)

      sudo fallocate -l 4G /swapfile1 && sudo chmod 600 /swapfile1 && sudo mkswap /swapfile1 && sudo swapon /swapfile1 && echo '/swapfile1 none swap sw 0 0' | sudo tee -a /etc/fstab
      
#### For btrfs user (e.g fedora and opensuse) use this command to enable swap

      sudo touch /swapfile1 && sudo chattr +C /swapfile1 && sudo dd if=/dev/zero of=/swapfile1 bs=1M count=4096 status=progress && sudo chmod 600 /swapfile1 && sudo mkswap /swapfile1 && sudo swapon /swapfile1 && echo '/swapfile1 none swap sw 0 0' | sudo tee -a /etc/fstab

## VMware Tools

If you installing on VMware, use this command to install the drivers

      sudo apt install open-vm-tools-desktop -y

# Personal Setup
I also post my own setup script [here](https://github.com/arfshl/linuxmint-postinstall/tree/main/personal-use)
