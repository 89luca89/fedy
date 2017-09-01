#!/bin/bash

CACHEDIR="/var/cache/fedy/soundnode";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL="http://www.soundnodeapp.com/downloads/linux64/Soundnode.zip"
else
	# 32 bit
	URL="http://www.soundnodeapp.com/downloads/linux32/Soundnode.zip"
fi
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/soundnode"
mkdir -p "/opt/Soundnode"
unzip -xq "$FILE" -d "/opt/Soundnode"

ln -sf "/opt/Soundnode/Soundnode" "/usr/bin/soundnode"

wget -c "http://www.soundnodeapp.com/images/logo.png" -O "/opt/Soundnode/soundnode.png"

xdg-icon-resource install --novendor --size "256" "/opt/Soundnode/soundnode.png" "soundnode"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat <<EOF | tee /usr/share/applications/soundnode.desktop
[Desktop Entry]
Name=Soundnode
Comment=An Electron wrapper for Sound Cloud
GenericName=Soundnode
Exec=/opt/Soundnode/Soundnode %U
Icon=soundnode
Type=Application
StartupNotify=true
Categories=AudioVideo;Audio;
EOF
