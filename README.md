# Linux for Home and Students

Post-install script that automates installation of daily driver apps, enables firewall, and configures encrypted DNS.

## Features
- One-click installation of daily driver apps 
- Enable and configure firewall (with UFW or firewalld)
- Setup DNS over TLS with systemd-resolved, using Cloudflare and Google DNS

## Supported Distros
- Linux Mint (All edition including LMDE)
- Fedora Cinnamon Spin

## Usage

Copy-paste this command on your terminal according to your distro

- Linux Mint Cinnamon

     wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/linuxmint/cinnamon.sh && sudo sh cinnamon.sh && rm cinnamon.sh