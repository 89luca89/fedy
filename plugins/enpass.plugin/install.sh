#!/bin/bash

CACHEDIR="/var/cache/fedy/Enpass";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

pkgver=5.5.3

arch | grep x86_64
if (( $? == 0));then
    # 64 bit
    URL="http://repo.sinew.in/pool/main/e/enpass/enpass_${pkgver}_amd64.deb"
else
    # 32 bit
    URL="http://repo.sinew.in/pool/main/e/enpass/enpass_${pkgver}_i386.deb"
fi

wget -c "$URL" -O "enpass.deb"

alien -r --scripts enpass.deb
mv enpass*.rpm enpass.rpm

rpm -i --nodeps --force ./enpass.rpm
gtk-update-icon-cache -f -t /usr/share/icons/hicolor
