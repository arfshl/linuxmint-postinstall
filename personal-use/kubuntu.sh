#!/bin/sh

# env is ubuntu based Linux

sudo add-apt-repository ppa:mozillateam/ppa -y
sudo add-apt-repository ppa:phoerious/keepassxc -y

echo 'Configuring APT Pinning...'
sudo tee /etc/apt/preferences.d/nativeapt > /dev/null <<EOF
Package: *
Pin: origin deb.debian.org
Pin-Priority: 1

Package: *
Pin: origin security.debian.org
Pin-Priority: 1

Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1000

Package: chromium
Pin: origin security.debian.org
Pin-Priority: 1000

Package: chromium-common
Pin: origin security.debian.org
Pin-Priority: 1000

Package: chromium-sandbox
Pin: origin security.debian.org
Pin-Priority: 1000

Package: firefox
Pin: release o=Ubuntu
Pin-Priority: -1

Package: thunderbird
Pin: release o=Ubuntu
Pin-Priority: -1

Package: chromium-browser
Pin: release o=Ubuntu
Pin-Priority: -1
EOF

echo 'Done'

# Install required tools
sudo apt install vlc zram-tools partitionmanager btop htop lynx brasero default-jre wget curl nano git systemd-timesyncd ufw gufw apache2 bind9 simplescreenrecorder rustup linux-headers-$(uname -r) build-essential libayatana-appindicator3-1 -y

# install protonvpn
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb && sudo dpkg -i ./protonvpn-stable-release_*_all.deb && sudo rm protonvpn-stable-release_*_all.deb && sudo apt update && sudo apt install proton-vpn-gnome-desktop -y

# generate custom grub config (disable os-prober, block kvm module, amoled black grub wallpaper, and enable verbose boot)
cp /home/user/Linux/Packages/1.png /home/user/1.png
sudo mv /etc/default/grub /etc/default/grub.bak
sudo tee /etc/default/grub > /dev/null <<EOF
GRUB_DEFAULT=0
GRUB_TIMEOUT=-1
GRUB_DISTRIBUTOR='Kubuntu'
#GRUB_CMDLINE_LINUX_DEFAULT='quiet splash'
GRUB_CMDLINE_LINUX_DEFAULT='kvm.enable_virt_at_load=0'
GRUB_CMDLINE_LINUX=""
GRUB_DISABLE_OS_PROBER=false
EOF
sudo update-grub

# disable apt pager
echo 'Binary::apt::Pager "false";' | sudo tee -a  /etc/apt/apt.conf.d/99nopager

# Set local rtc clock, same with the system clock, for dualboot systems
timedatectl set-local-rtc 1

# install all local .deb apps
cd /home/user/Linux/Packages/
sudo apt install ./*.deb

# fix 'cant enumerate usb devices in virtualbox'
sudo usermod -aG vboxusers alif

# add virtualbox repo
#deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian <mydist> contrib
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo tee /etc/apt/sources.list.d/virtualbox.list > /dev/null <<EOF
deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian noble contrib
EOF

# add gh desktop repo
sudo curl https://gpg.polrivero.com/public.key | sudo gpg --dearmor -o /usr/share/keyrings/polrivero.gpg
echo "deb [signed-by=/usr/share/keyrings/polrivero.gpg] https://deb.github-desktop.polrivero.com/ stable main" | sudo tee /etc/apt/sources.list.d/github-desktop-plus.list
sudo apt install github-desktop-plus

# install vmware-workstation
sudo ./VM*

# Copy Applications folder to home
cd
cp -r /home/user/Linux/Applications /home/user/Applications

# Enable powertunnel services
cd /home/user/Applications/PowerTunnel/
sudo cp /home/user/Applications/PowerTunnel/powertunnel.service /etc/systemd/system/powertunnel.service
sudo systemctl enable powertunnel
sudo systemctl start powertunnel

# Enable AdGuardHome
sudo systemctl stop named
sudo systemctl disable named
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
cd /home/user/Applications/AdGuardHome
sudo ./AdGuardHome -s install
sudo systemctl start AdGuardHome

# disable networkmanager management for /etc/resolv.conf
#sudo tee /etc/NetworkManager/conf.d/nodns.conf > /dev/null <<EOF
#[main]
#dns=none
#EOF

# rewrite /etc/resolv.conf
sudo mv /etc/resolv.conf /etc/resolv.conf.bak
echo 'nameserver 127.0.0.1' | sudo tee -a /etc/resolv.conf

# Enable UFW, Profile default, Deny incoming, Allow outgoing
echo "Updating Firewall..."
sudo apt install ufw gufw -y
echo "Enabling Firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose
sudo ufw allow 53317/tcp
sudo ufw allow 53317/udp

# Enable zram with lz4 compression algorithm
echo "Installing zram-tools..."
sudo apt install zram-tools -y
echo "Enabling zram..."
echo 'ALGO=lz4
PERCENT=50' | sudo tee -a /etc/default/zramswap
echo 'vm.page-cluster = 0' | sudo tee -a /etc/sysctl.conf

# Enable swapfile with 4GB of size
sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# remove unnecessary package
sudo apt purge libreoffice* thunderbird gimp konqueror juk dragonplayer kmail akregator -y

# Setup nodejs 24.x LTS
sudo apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v

# install weathr rust app
rustup toolchain install nightly
cargo install weathr
sudo ln -s /home/user/.cargo/bin/weathr /usr/bin/weathr
mkdir /home/user/.config/weathr/
tee /home/user/.config/weathr/config.toml > /dev/null <<EOF
# Hide the HUD (Heads Up Display) with weather details
hide_hud = false

# Run silently without startup messages (errors still shown)
silent = false

[location]
# Location coordinates (overridden if auto = true)
latitude = 
longitude = 

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
