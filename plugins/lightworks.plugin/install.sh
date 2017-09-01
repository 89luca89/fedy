#!/bin/bash

CACHEDIR="/var/cache/fedy/lightworks";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL="https://www.lwks.com/index.php?option=com_docman&task=doc_download&gid=195"
FILE="lwks.rpm"

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

dnf -y install $FILE

# Little fix to start lightworks on Wayland
echo "[Desktop Entry]
Version=14.0.0.0
Name=Lightworks
Comment=Cross-platform film & video editor
Exec=env GDK_BACKEND=x11 /usr/bin/lightworks
Icon=/usr/share/lightworks/Icons/App.png
Terminal=false
Type=Application
Categories=AudioVideo;AudioVideoEditing;
StartupWMClass=Ntcardvt" | tee /usr/share/applications/lightworks.desktop


