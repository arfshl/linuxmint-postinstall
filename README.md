# Linux Mint Post-Install scripts

## Features
- One-click installation, Just copy-paste command on Terminal
- Automates installation of daily driver apps and Microsoft fonts
- Adding App Shortcut to Desktop for easy access
- Ensure that firewall is enabled
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

## VMware Tools

If you installing Linux Mint on VMware, use this command to install the drivers

      sudo apt install open-vm-tools-desktop -y

