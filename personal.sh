#!/bin/sh
# this is my personal customization for the applist
# env is mint xfce:

# Updating package database
echo "Updating package database..."
sudo apt update

# Install OnlyOffice
echo "Installing OnlyOffice as Microsoft Office replacement..."
wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb -P $HOME/pkgtmp
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | sudo debconf-set-selections
sudo apt install $HOME/pkgtmp/onlyoffice-desktopeditors_amd64.deb -y
xdg-mime default onlyoffice-desktopeditors.desktop application/pdf
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.document
xdg-mime default onlyoffice-desktopeditors.desktop application/msword
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-word.document.macroEnabled.12
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-excel
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-excel.sheet.macroEnabled.12
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-excel.sheet.binary.macroEnabled.12
xdg-mime default onlyoffice-desktopeditors.desktop text/csv
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.openxmlformats-officedocument.presentationml.presentation
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-powerpoint
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-powerpoint.presentation.macroEnabled.12
rm $HOME/pkgtmp/onlyoffice-desktopeditors_amd64.deb
rmdir $HOME/pkgtmp/
ln -s /usr/share/applications/onlyoffice-desktopeditors.desktop $HOME/Desktop/onlyoffice-desktopeditors.desktop
chmod -R 755 $HOME/Desktop/
echo "OnlyOffice Installed"

# Install spotify-client
echo "Installing Spotify Client..."
sudo apt-get install spotify-client -y
ln -s /usr/share/applications/spotify.desktop $HOME/Desktop/spotify.desktop
chmod -R 755 $HOME/Desktop/
echo "Spotify Client Installed"

# Install VLC, UFW, GUFW, systemd-resolved, ttf-mscorefonts firefox
echo "Installing System Tools..."
echo "Installing VLC..."
echo "Installing Microsoft fonts..."
echo "Updating Mozilla Firefox..."
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | sudo debconf-set-selections
sudo apt install vlc ttf-mscorefonts-installer cheese gnome-system-monitor gnome-clocks simplescreenrecorder firefox -y
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska
xdg-mime default vlc.desktop audio/mpeg
xdg-mime default vlc.desktop video/hevc
xdg-mime default vlc.desktop video/webm
ln -s /usr/share/applications/vlc.desktop $HOME/Desktop/vlc.desktop
ln -s /usr/share/applications/firefox.desktop $HOME/Desktop/firefox.desktop
chmod -R 755 $HOME/Desktop/
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

# install htop, btop, and gnome system monitor
sudo apt install htop btop gnome-system-monitor -y

# install tor broswer launcher
sudo apt install torbrowser-launcher -y

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
