#!/bin/sh

# install tools
sudo apt install wget curl nano git adb btop htop lynx bind9 apache2 -y

# install nodejs lts

sudo apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm install -g http-server

# disable apt pager
echo 'Binary::apt::Pager "false";' | sudo tee -a  /etc/apt/apt.conf.d/99nopager
