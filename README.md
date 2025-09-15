# Linux for Home and Students

Post-install script that automates installation of daily driver apps, enables firewall, and configures encrypted DNS.

## Features
- One-click installation of daily driver apps 
- Esure that firewall is enabled (Using `ufw` on Debian/Ubuntu-based distribution and `firewalld` on Fedora)
- Setup DNS over TLS with systemd-resolved, using Cloudflare and Google DNS

## Supported Distros
- Linux Mint (All edition including LMDE)
- Fedora Cinnamon Spin

## Usage

Copy-paste this command on your terminal according to your distro

- Linux Mint Cinnamon

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/linuxmint/cinnamon.sh && sudo sh cinnamon.sh && rm cinnamon.sh

Also Tested and Compatible with

- Linux Mint MATE
- Linux Mint Debian Edition
- Ubuntu MATE


- Linux Mint XFCE

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/linuxmint/xfce.sh && sudo sh xfce.sh && rm xfce.sh
