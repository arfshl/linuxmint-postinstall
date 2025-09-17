# Linux for Home and Students

Post-install script that automates installation of daily driver apps and Microsoft fonts, enables firewall, and configures encrypted DNS.

## Features
- One-click installation, Just copy-paste command on Terminal
- Automates daily driver apps and Microsoft fonts
- Ensure that firewall is enabled (Using `ufw` on Debian/Ubuntu-based distribution and `firewalld` on Fedora)
- Setup DNS over TLS with systemd-resolved, using Cloudflare and Google DNS

## Auto-Installed Apps
- Google Chrome
- Mozilla Firefox
- [OnlyOffice](https://www.onlyoffice.com/download-desktop.aspx) as Microsoft Office replacement, but you can still access Office Online or Google Workspaces via web browser
- VLC Media Player
- Spotify Linux Client

## Supported Distros
- Linux Mint (All edition including LMDE)
- Fedora Cinnamon Spin

## Usage

Copy-paste this command on your terminal according to your distro

- Linux Mint Cinnamon

- Linux Mint MATE

- Linux Mint XFCE

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/linuxmint/xfce.sh && sudo sh xfce.sh && rm xfce.sh
