#!/bin/bash

dnf -y install bzip2-libs
ln -sf /usr/lib64/libbz2.so.1 /usr/lib64/libbz2.so.1.0

CACHEDIR="/var/cache/fedy/cinelerra";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL="https://netcologne.dl.sourceforge.net/project/heroines/cinelerra-6-x86_64.tar.xz"
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [ ! -f "$FILE" ]; then
	exit 1
fi

rm -rf "/opt/Cinelerra"
mkdir -p "/opt/Cinelerra"
tar xvpf "$FILE" -C "/opt/Cinelerra"

ln -sf "/opt/Cinelerra/bin/cinelerra" "/usr/bin/cinelerra"

wget "https://cn.pling.com/img//hive/content-pre1/43540-1.png" -O /opt/Cinelerra/cinelerra.png

xdg-icon-resource install --novendor --size "96" "/opt/Cinelerra/cinelerra.png" "cinelerra"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

chown $(users) -R "/opt/Cinelerra"

echo "[Desktop Entry]
Type=Application
Name=Cinelerra
Name[de]=Cinelerra
GenericName=Video Editor
Comment=Video Editor
Terminal=false
Exec=/opt/Cinelerra/bin/cinelerra
Icon=cinelerra" | tee /usr/share/applications/cinelerra.desktop
