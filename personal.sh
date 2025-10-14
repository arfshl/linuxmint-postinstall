#!/bin/sh
# this is my personal customization for the applist
# env is mint xfce:
wget https://raw.githubusercontent.com/arfshl/linuxmint-postinstall/refs/heads/main/xfce.sh && sh xfce.sh && rm xfce.sh

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

# install brave
curl -fsS https://dl.brave.com/install.sh | sh

# install github-desktop
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
sudo apt update && sudo apt install github-desktop
