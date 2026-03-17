#!/bin/sh
# this is my personal customization for the applist
# env is fedora spin kde

# enable rpmfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# install package
sudo dnf install libayatana-appindicator-gtk3 keepassxc firefox vlc btop htop git java-25-openjdk-headless rustup kernel-devel-$(uname -r) kernel-headers-$(uname -r) -y
sudo dnf install @development-tools

# mark as user installed
sudo dnf mark user java-25-openjdk-headless -y

# install latest nodejs
sudo dnf install -y curl
curl -fsSL https://rpm.nodesource.com/setup_24.x | sudo bash -
sudo dnf install -y nodejs
node -v
npm install -g http-server

# install protonvpn
wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm" && sudo dnf install ./protonvpn-stable-release-1.0.3-1.noarch.rpm && sudo dnf check-update --refresh  && sudo dnf install proton-vpn-gnome-desktop 

# Set local rtc clock, same with the system clock, for dualboot systems
timedatectl set-local-rtc 1

# Enable powertunnel services
cd /home/alif/Applications/PowerTunnel/
sudo cp /home/alif/Applications/PowerTunnel/powertunnel.service /etc/systemd/system/powertunnel.service
sudo systemctl enable powertunnel
sudo systemctl start powertunnel

# Enable AdGuardHome
sudo systemctl stop named
sudo systemctl disable named
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
cd /home/alif/D_DRIVE/Applications/AdGuardHome
sudo ./AdGuardHome -s install
sudo systemctl start AdGuardHome

# rewrite /etc/resolv.conf
sudo mv /etc/resolv.conf /etc/resolv.conf.bak
echo 'nameserver 127.0.0.1' | sudo tee -a /etc/resolv.conf

# remove
sudo dnf remove thunderbird libreoffice* -y

# allowport for localsend
sudo firewall-cmd --permanent --add-port=53317/tcp
sudo firewall-cmd --permanent --add-port=53317/udp
sudo firewall-cmd --reload

# install weathr rust app
rustup toolchain install stable
cargo install weathr
sudo ln -s /home/alif/.cargo/bin/weathr /usr/bin/weathr
mkdir -p /home/alif/.config/weathr/
tee /home/alif/.config/weathr/config.toml > /dev/null <<EOF
# Hide the HUD (Heads Up Display) with weather details
hide_hud = false

# Run silently without startup messages (errors still shown)
silent = false

[location]
# Location coordinates (overridden if auto = true)
latitude = -3.6486
longitude = 103.771

# Auto-detect location via IP (defaults to true if config missing)
auto = false

# Hide the location name in the UI
hide = false

[units]
# Temperature unit: "celsius" or "fahrenheit"
temperature = "celsius"

# Wind speed unit: "kmh", "ms", "mph", or "kn"
wind_speed = "kmh"

# Precipitation unit: "mm" or "inch"
precipitation = "mm"
EOF


