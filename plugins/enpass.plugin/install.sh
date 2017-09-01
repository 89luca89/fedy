#!/bin/bash

CACHEDIR="/var/cache/fedy/Enpass";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

pkgver=$(wget https://www.enpass.io/downloads/ -O - | grep Linux | grep "Latest version" | grep -o "[0-9].[0-9].[0-9]")
URL="https://dl.sinew.in/linux/setup/5-5-6/Enpass_Installer_"$pkgver

wget -c "$URL" -O "installer"
chmod +x ./installer
# Workaround to install it in /opt/Enpass instead of /home/$USER/Enpass
HOME=/opt ./installer