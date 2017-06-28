#!/bin/bash

dnf -y install libappindicator-gtk*

CACHEDIR="/var/cache/fedy/wire-desktop";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

pkgver=
arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL=$(wget "http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/updates/25/x86_64/" -O - | grep wire-desktop |  sed 's/.*\">//g' | sed 's/<\/a.*//g' | tail -n 1)
else
	# 32 bit
	URL=$(wget "http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/updates/25/x86_64/" -O - | grep wire-desktop |  sed 's/.*\">//g' | sed 's/<\/a.*//g' | head -n 1)

fi
URL="http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/updates/25/x86_64/"$URL
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

dnf -y install "$FILE"
