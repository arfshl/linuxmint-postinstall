#!/bin/sh

# Install Google Chrome
echo "Installing Google Chrome..."
mkdir -p $HOME/pkgtmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $HOME/pkgtmp
sudo apt install $HOME/pkgtmp/google-chrome-stable_current_amd64.deb -y
xdg-settings set default-web-browser google-chrome.desktop
rm $HOME/pkgtmp/google-chrome-stable_current_amd64.deb
cp /usr/share/applications/google-chrome.desktop $HOME/Desktop/google-chrome.desktop
chmod -R 755 $HOME/Desktop/
echo "Google Chrome Installed"

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
cp /usr/share/applications/onlyoffice-desktopeditors.desktop $HOME/Desktop/onlyoffice-desktopeditors.desktop
chmod -R 755 $HOME/Desktop/
echo "OnlyOffice Installed"

# Install spotify-client
echo "Installing Spotify Client..."
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y
cp /usr/share/applications/spotify.desktop $HOME/Desktop/spotify.desktop
chmod -R 755 $HOME/Desktop/
echo "Spotify Client Installed"

# Install VLC, UFW, GUFW, systemd-resolved, ttf-mscorefonts firefox
echo "Installing System Tools..."
echo "Installing VLC..."
echo "Installing Microsoft fonts..."
echo "Updating Mozilla Firefox..."
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | sudo debconf-set-selections
sudo apt install vlc ttf-mscorefonts-installer cheese gnome-clocks -y
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska
xdg-mime default vlc.desktop audio/mpeg
xdg-mime default vlc.desktop video/hevc
xdg-mime default vlc.desktop video/webm
cp /usr/share/applications/vlc.desktop $HOME/Desktop/vlc.desktop
cp /usr/share/applications/firefox.desktop $HOME/Desktop/firefox.desktop
chmod -R 755 $HOME/Desktop/
echo "System Tools Installed"

# Enable UFW, Profile default, Deny incoming, Allow outgoing
echo "Enabling Firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose

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

sudo systemctl enable systemd-resolved 
sudo systemctl restart systemd-resolved
 
# Done Process
echo "Welcome to Linux Mint!"
