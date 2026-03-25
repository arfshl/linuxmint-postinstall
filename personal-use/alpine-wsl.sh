#!/bin/sh

# update and upgrade package database
sudo apk upgrade

# install prequisites
sudo apk add sudo curl wget nano git yt-dlp ffmpeg

## Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install --lts

# Verify the Node.js version:
node -v # Should print "v24.14.1".

# Verify npm version:
npm -v # Should print "11.11.0".
npm install -g http-server
