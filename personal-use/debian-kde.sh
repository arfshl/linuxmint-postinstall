#!/bin/sh

# env is debian based Linux
# we take example of username is user

# Install required tools
sudo apt install vlc zram-tools btop htop brasero default-jre wget curl nano git systemd-timesyncd ufw gufw apache2 bind9 simplescreenrecorder rustup -y

# install protonvpn
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb && sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo rm protonvpn-stable-release_1.0.8_all.deb && sudo apt update && sudo apt install proton-vpn-gnome-desktop

# install weathr rust app
rustup toolchain install nightly
cargo install weathr
sudo ln -s /home/user/.cargo/bin/weathr /usr/bin/weathr
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

# generate custom grub config (disable os-prober, block kvm module, and enable verbose boot, amoled black grub wallpaper}
cp /home/user/1.png /home/user/1.png
sudo mv /etc/default/grub /etc/default/grub.bak
sudo tee /etc/default/grub > /dev/null <<EOF
GRUB_DEFAULT=0
GRUB_TIMEOUT=-1
GRUB_DISTRIBUTOR='Debian'
#GRUB_CMDLINE_LINUX_DEFAULT='quiet splash'
GRUB_CMDLINE_LINUX_DEFAULT='kvm.enable_virt_at_load=0'
GRUB_CMDLINE_LINUX=""
GRUB_BACKGROUND="/home/user/1.png"
GRUB_DISABLE_OS_PROBER=false
EOF
sudo update-grub


# disable apt pager
echo 'Binary::apt::Pager "false";' | sudo tee -a  /etc/apt/apt.conf.d/99nopager

# Set local rtc clock, same with the system clock, for dualboot systems
timedatectl set-local-rtc 1

# install all local .deb apps
cd 
sudo apt install ./*.deb

# fix 'cant enumerate usb devices in virtualbox'
sudo usermod -aG vboxusers user

# install vmware-workstation
sudo ./VM*

# Set-Up Waterfox
cd /home/user/waterfox
sudo cp /home/user/waterfox/waterfox.desktop /usr/share/applications

# Enable powertunnel services
cd /home/user/PowerTunnel/
sudo cp /home/user/PowerTunnel/powertunnel.service /etc/systemd/system/powertunnel.service
sudo systemctl enable powertunnel
sudo systemctl start powertunnel

# Enable AdGuardHome
cd /home/user/AdGuardHome
sudo ./AdGuardHome -s install
sudo systemctl start AdGuardHome

# disable networkmanager management for /etc/resolv.conf
sudo tee /etc/NetworkManager/conf.d/nodns.conf > /dev/null <<EOF
[main]
dns=none
EOF

# rewrite /etc/resolv.conf
sudo rm /etc/resolv.conf
echo 'nameserver 127.0.0.1' | sudo tee -a /etc/resolv.conf

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

# remove unnecessary package
sudo apt remove libreoffice* thunderbird firefox-esr gimp konqueror -y
