#!/bin/bash

dnf -y install libappindicator-gtk*

CACHEDIR="/var/cache/fedy/WhatsApp";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
    # 64 bit
    URL="https://github.com/gsantner/whatsie/releases/download/v2.1.0/whatsie-2.1.0-linux-amd64.deb"
else
    # 32 bit
    URL="https://github.com/gsantner/whatsie/releases/download/v2.1.0/whatsie-2.1.0-linux-i386.deb"
fi

wget -c "$URL" -O "whatsie.deb"

alien -r --scripts whatsie.deb
mv whatsie*.rpm whatsie.rpm

rpm2cpio whatsie.rpm | cpio -vid
cp -r ./opt/whatsie /opt/
cp -r ./usr/share/icons/* /usr/share/icons/
cp ./usr/share/applications/whatsie.desktop /usr/share/applications
gtk-update-icon-cache -f -t /usr/share/icons/hicolor
