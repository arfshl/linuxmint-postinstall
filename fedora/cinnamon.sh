#!/bin/sh

# Install Google Chrome
echo "Installing Google Chrome..."
sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.rpm -y
cp /usr/share/applications/google-chrome.desktop $HOME/Desktop/google-chrome.desktop
chmod -R 755 $HOME/Desktop/
xdg-settings set default-web-browser google-chrome.desktop
echo "Google Chrome Installed"

# Install OnlyOffice
echo "Installing OnlyOffice as Microsoft Office replacement..."
sudo dnf install https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors.x86_64.rpm -y
cp /usr/share/applications/onlyoffice-desktopeditors.desktop $HOME/Desktop/onlyoffice-desktopeditors.desktop
chmod -R 755 $HOME/Desktop/
xdg-mime default onlyoffice-desktopeditors.desktop application/pdf
echo "OnlyOffice Installed"

# Install spotify-client
flatpak install flathub com.spotify.Client -y
cp /usr/share/applications/com.spotify.Client.desktop $HOME/Desktop/com.spotify.Client.desktop
chmod -R 755 $HOME/Desktop/

# Install VLC, UFW, GUFW, systemd-resolved, ttf-mscorefonts firefox
echo "Installing VLC..."
echo "Installing Microsoft fonts..."
echo "Updating Mozilla Firefox..."
sudo dnf install vlc systemd-resolved curl cabextract xorg-x11-font-utils fontconfig -y
sudo dnf install -y https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
cp /usr/share/applications/vlc.desktop $HOME/Desktop/vlc.desktop
cp /usr/share/applications/org.mozilla.firefox.desktop $HOME/Desktop/org.mozilla.firefox.desktop
chmod -R 755 $HOME/Desktop/
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska
xdg-mime default vlc.desktop audio/mpeg
xdg-mime default vlc.desktop video/hevc
xdg-mime default vlc.desktop video/webm

# Enable DNS-Over-TLS with systemd-resolved, Primary server is cloudflare and secondary is google
echo "Enabling Encrypted DNS..."
sudo tee -a /etc/systemd/resolved.conf > /dev/null <<EOF
DNS=1.1.1.1#cloudflare-dns.com
FallbackDNS=8.8.8.8#dns.google
DNSSEC=allow-downgrade
DNSOverTLS=yes
Domains=~.
ReadEtcHosts=yes
EOF
sudo systemctl restart systemd-resolved
sudo systemctl enable systemd-resolved 
 
# Done Process
echo "Welcome, Your Linux Mint XFCE is now ready for daily usage as Windows, but with less annoying and more private"
echo "Don't forget to explore the Software Manager for more apps!"
echo "And Update Manager to check for new update with NO forced updates or reboot"
