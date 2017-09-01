#!/bin/bash

dnf -y install libappindicator-gtk*

CACHEDIR="/var/cache/fedy/WhatsApp";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL="ftp://ftp.ntua.gr/pub/linux/pclinuxos/pclinuxos/apt/pclinuxos/64bit/RPMS.x86_64/whatsie-2.0.15-linux-x86_64.rpm"

wget -c "$URL" -O "whatsie.rpm"
dnf -y install ./whatsie.rpm