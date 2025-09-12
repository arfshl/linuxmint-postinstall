#!/bin/sh

# Install Google Chrome
echo "Installing Google Chrome"
mkdir -p $HOME/pkgtmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $HOME/pkgtmp
sudo dpkg -i $HOME/pkgtmp/google-chrome-stable_current_amd64.deb
sudo apt install -fy
ln -s /usr/share/applications/google-chrome.desktop $HOME/Desktop/google-chrome.desktop
rm $HOME/pkgtmp/google-chrome-stable_current_amd64.deb
echo "Google Chrome Installed"

# Install OnlyOffice
echo "Installing OnlyOffice as Microsoft Office replacement"
wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb -O $HOME/pkgtmp
sudo dpkg -i $HOME/pkgtmp/onlyoffice-desktopeditors_amd64.deb
sudo apt install -fy
ln -s /usr/share/applications/onlyoffice-desktopeditors.desktop $HOME/Desktop/onlyoffice-desktopeditors.desktop\
rm $HOME/pkgtmp/onlyoffice-desktopeditors_amd64.deb
echo "OnlyOffice Installed"

# Install Zoom Linux Client
