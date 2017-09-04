#!/bin/bash

CACHEDIR="/var/cache/fedy/shotcut";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL=$(wget "https://github.com/mltframework/shotcut/releases/latest" -O - | grep tar.bz2 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g'| grep -v strong | head -n 1)

URL=$(echo "www.github.com"$URL | sed 's/ //g')
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/Shotcut"
tar xvxf "$FILE" -C "/opt/"

ln -sf "/opt/Shotcut/Shotcut.app/shotcut" "/usr/bin/shotcut"

wget "https://pbs.twimg.com/profile_images/2508100084/shotcut-logo-64_400x400.png" -O /opt/Shotcut/shotcut.png

xdg-icon-resource install --novendor --size "256" "/opt/Shotcut/shotcut.png" "shotcut"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

echo "[Desktop Entry]
Type=Application
Name=Shotcut
Name[de]=Shotcut
GenericName=Video Editor
GenericName[de]=Video Bearbeitungsprogramm
Comment=Video Editor
Comment[de]=Programm zum Bearbeiten und Abspielen von Videodateien.
Terminal=false
Exec=/opt/Shotcut/Shotcut.app/shotcut %F
Icon=shotcut" | tee /usr/share/applications/Shotcut.desktop
