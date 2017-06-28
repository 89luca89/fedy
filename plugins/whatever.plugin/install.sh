#!/bin/bash

dnf -y install libappindicator-gtk*

CACHEDIR="/var/cache/fedy/whatever";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL=$(wget "https://github.com/CellarD0-0r/whatever/releases/" -O - | grep whatever | grep rpm | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | tail -n 1)
else
	# 32 bit
	URL=$(wget "https://github.com/CellarD0-0r/whatever/releases/" -O - | grep whatever | grep rpm | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | head -n 1)
fi
URL=$(echo "www.github.com"$URL | sed 's/ //g')
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

wget -c "https://raw.githubusercontent.com/CellarD0-0r/whatever/master/build/icons/128x128.png" -O "whatever.png"
xdg-icon-resource install --novendor --size "128" "whatever.png" "whatever"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

dnf -y install "$FILE"
