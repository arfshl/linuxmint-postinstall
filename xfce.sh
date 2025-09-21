#!/bin/sh

# Updating base systems
sudo apt update && sudo apt upgrade -y

# Install Google Chrome
echo "Installing Google Chrome..."
mkdir -p $HOME/pkgtmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $HOME/pkgtmp
sudo apt install $HOME/pkgtmp/google-chrome-stable_current_amd64.deb -y
xdg-settings set default-web-browser google-chrome.desktop
rm $HOME/pkgtmp/google-chrome-stable_current_amd64.deb
ln -s /usr/share/applications/google-chrome.desktop $HOME/Desktop/google-chrome.desktop
echo "Google Chrome Installed"

# Install OnlyOffice
echo "Installing OnlyOffice as Microsoft Office replacement..."
wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb -O $HOME/pkgtmp
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
sudo apt install vlc ttf-mscorefonts-installer ufw gufw systemd-resolved firefox cheese nemo mate-terminal gnome-system-monitor gnome-clocks -y
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska
xdg-mime default vlc.desktop audio/mpeg
xdg-mime default vlc.desktop video/hevc
xdg-mime default vlc.desktop video/webm
xdg-mime default mate-terminal.desktop x-scheme-handler/terminal
xdg-mime default nemo.desktop inode/directory
sudo update-alternatives --install /usr/bin/gnome-terminal gnome-terminal /usr/bin/mate-terminal 50
ln -s /usr/share/applications/vlc.desktop $HOME/Desktop/vlc.desktop
ln -s /usr/share/applications/firefox.desktop $HOME/Desktop/firefox.desktop
ln -s /usr/share/applications/mintinstall.desktop $HOME/Desktop/mintinstall.desktop
ln -s /usr/share/applications/thunderbird.desktop $HOME/Desktop/thunderbird.desktop
ln -s /usr/share/applications/nemo.desktop $HOME/Desktop/nemo.desktop
ln -s /usr/share/applications/mate-terminal.desktop $HOME/Desktop/mate-terminal.desktop
ln -s /usr/share/applications/org.gnome.clocks.desktop $HOME/Desktop/org.gnome.clocks.desktop
ln -s /usr/share/applications/org.gnome.SystemMonitor.desktop $HOME/Desktop/org.gnome.SystemMonitor.desktop
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
echo "Welcome, Your Linux Mint is now ready for daily usage as Windows, but with less annoying and more private"
echo "Don't forget to explore the Software Manager for more apps!"
echo "And Update Manager to check for new update with NO forced updates or reboot"
