#!/bin/bash

CACHEDIR="/var/cache/fedy/sunvox";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

VERSION=$(wget 'http://www.warmplace.ru/soft/sunvox/' -O - | grep -o "Latest release.*" | grep -o [0-9\.]*  | head -n1)

URL="http://www.warmplace.ru/soft/sunvox/sunvox-"$VERSION".zip"
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/sunvox"
unzip -xq "$FILE" -d "/opt/"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	ARCH="x86_64"
else
	# 32 bit
	ARCH="x86"
fi

ln -sf "/opt/sunvox/sunvox/linux_"$ARCH"/sunvox" "/usr/bin/sunvox"

wget -c "http://www.warmplace.ru/soft/sunvox/disk.png" -O "/opt/sunvox/sunvox.png"

xdg-icon-resource install --novendor --size "128" "/opt/sunvox/sunvox.png" "sunvox"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat <<EOF | tee /usr/share/applications/sunvox.desktop
[Desktop Entry]
Name=Sunvox
Icon=sunvox
Exec=/usr/bin/sunvox
Terminal=false
Type=Application
StartupNotify=true
EOF
