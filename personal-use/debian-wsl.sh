#!/bin/sh

# install tools
sudo apt install wget curl nano git adb btop htop lynx bind9 apache2 -y

#  install nodejs lts
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install lts/*
# Verify the Node.js version:
node -v # Should print "v24.15.0".
# Download and install Yarn:
corepack enable yarn
# Verify Yarn version:
yarn -v
npm install -g http-server


# disable apt pager
echo 'Binary::apt::Pager "false";' | sudo tee -a  /etc/apt/apt.conf.d/99nopager
