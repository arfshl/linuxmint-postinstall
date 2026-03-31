#!/bin/sh

# update and upgrade package database
sudo apk upgrade

# install prequisites
sudo apk add sudo curl wget nano git yt-dlp android-tools htop btop lynx