#!/bin/sh

# add nodejs repository
#Setup nodejs 24.x LTS
sudo apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -

# install package
sudo apt install nodejs rustup build-essential wget nano curl lynx git 

# disable apt pager
echo 'Binary::apt::Pager "false";' | sudo tee -a  /etc/apt/apt.conf.d/99nopager

# install weathr rust app
rustup toolchain install stable
cargo install weathr
sudo ln -s /home/alif/.cargo/bin/weathr /usr/bin/weathr
mkdir /home/alif/.config/weathr/
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

