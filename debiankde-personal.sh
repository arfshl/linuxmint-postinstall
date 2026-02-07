#!/bin/sh
sudo apt install vlc zram-tools btop htop brasero default-jre wget curl nano git systemd-timesyncd ufw gufw apache2 simplescreenrecorder -y
timedatectl set-local-rtc 1
sudo ./VM*
sudo apt install ./*.deb
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
sudo apt remove libreoffice* thunderbird firefox-esr gimp -y
