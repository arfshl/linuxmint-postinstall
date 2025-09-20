# Linux for Home and Students

Post-install script that automates installation of daily driver apps and Microsoft fonts, enables firewall, and configures encrypted DNS.

Aims to make Linux distribution usage easier as free and open-source alternative for Windows and macOS, Both at personal computer or bigger deployment like education and
government environment

## Features
- One-click installation, Just copy-paste command on Terminal
- Automates installation of daily driver apps and Microsoft fonts
- Adding App Shortcut to Desktop for easy access
- Ensure that firewall is enabled (Using `ufw` on Debian/Ubuntu-based distribution and `firewalld` on Fedora)
- Setup DNS over TLS with systemd-resolved, using Cloudflare and Google DNS

## Auto-Installed Apps
- Google Chrome
- Mozilla Firefox
- Thunderbird Email Client
- [OnlyOffice](https://www.onlyoffice.com/download-desktop.aspx) as Microsoft Office replacement, but you can still access Office Online or Google Workspaces via web browser
- VLC Media Player
- Spotify Linux Client
- GNOME Cheese (Camera App)

## Supported Distros
- Linux Mint (All edition including LMDE)
- Lubuntu
- Fedora Cinnamon Spin
- Fedora LXQt Spin

## Usage

Here is supported Linux distribution and corresponding installation commands

Just copy-paste the commands to your terminal and execute. The script will automatically downloaded and executed

- Linux Mint Cinnamon/Linux Mint Debian Edition

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/linuxmint/cinnamon.sh && sudo sh cinnamon.sh && rm cinnamon.sh

- Linux Mint MATE

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/linuxmint/mate.sh && sudo sh mate.sh && rm mate.sh

- Linux Mint XFCE

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/linuxmint/xfce.sh && sudo sh xfce.sh && rm xfce.sh

- Lubuntu

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/ubuntu/lubuntu.sh && sudo sh lubuntu.sh && rm lubuntu.sh

- Kubuntu

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/ubuntu/kubuntu.sh && sudo sh kubuntu.sh && rm kubuntu.sh

- Fedora Cinnamon Spin

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/fedora/cinnamon.sh && sudo sh cinnamon.sh && rm cinnamon.sh

- Fedora KDE

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/fedora/kde.sh && sudo sh kde.sh && rm kde.sh

- Fedora LXQt Spin

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/fedora/lxqt.sh && sudo sh lxqt.sh && rm lxqt.sh

- Fedora LXDE Spin

      wget https://raw.githubusercontent.com/arfshl/linux-home-and-student/refs/heads/main/fedora/lxde.sh && sudo sh lxde.sh && rm lxde.sh
