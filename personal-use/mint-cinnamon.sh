#!/bin/sh
# this is my personal customization for the applist
# env is mint Cinnamon:

# Updating package database
echo "Updating package database..."
sudo apt update

# remove unnecessary package
sudo apt remove libreoffice* thunderbird firefox -y

# Install VLC, UFW, GUFW, systemd-resolved, ttf-mscorefonts firefox
echo "Installing System Tools..."
echo "Installing VLC..."
echo "Installing Microsoft fonts..."
sudo apt install vlc cheese gnome-system-monitor gnome-clocks simplescreenrecorder -y
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska
xdg-mime default vlc.desktop audio/mpeg
xdg-mime default vlc.desktop video/hevc
xdg-mime default vlc.desktop video/webm
echo "System Tools Installed"

# Enable UFW, Profile default, Deny incoming, Allow outgoing
echo "Updating Firewall..."
sudo apt install ufw gufw -y
echo "Enabling Firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose

# Enable zram with lz4 compression algorithm
echo "Installing zram-tools..."
sudo apt install zram-tools -y
echo "Enabling zram..."
echo 'ALGO=lz4
PERCENT=50' | sudo tee -a /etc/default/zramswap
echo 'vm.page-cluster = 0' | sudo tee -a /etc/sysctl.conf

# Done Process
echo "Welcome to Linux Mint!"
echo "To apply zram configuration, please reboot"
# install git
sudo apt install git -y

# install htop, btop, brasero, and gnome system monitor
sudo apt install htop btop gnome-system-monitor gnome-disk-utility brasero -y

# install tor broswer launcher
sudo apt install torbrowser-launcher -y

# install jre
sudo apt install default-jre -y

# install vscode
sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
rm -f microsoft.gpg
echo 'deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main' >> /etc/apt/sources.list.d/vscode.list
#Types: deb
#URIs: https://packages.microsoft.com/repos/code
#Suites: stable
#Components: main
#Architectures: amd64,arm64,armhf
#Signed-By: /usr/share/keyrings/microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y # or code-insiders

# install github-desktop
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
sudo apt update && sudo apt install github-desktop
