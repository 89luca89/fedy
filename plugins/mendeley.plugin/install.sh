#!/bin/bash

CACHEDIR="/var/cache/fedy/mendeley";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL="https://www.mendeley.com/client/get/100-2/"
else
	# 32 bit
	URL="https://www.mendeley.com/client/get/100-1/"
fi
FILE="mendeley.tar.gz"

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/mendeley"
mkdir -p "/opt/mendeley"
tar xvxf "$FILE" -C "/opt/mendeley"
mv /opt/mendeley/mendeley* "/opt/mendeley/mendeley"

ln -sf "/opt/mendeley/mendeley" "/usr/bin/mendeley"

xdg-icon-resource install --novendor --size "128" "/opt/mendeley/mendeley/share/icons/hicolor/128x128/apps/mendeleydesktop.png" "mendeleydesktop"


cat <<EOF | tee /usr/share/applications/mendeleydesktop.desktop
[Desktop Entry]
Name=Mendeley Desktop
GenericName=Research Paper Manager
Comment=Mendeley Desktop is software for managing and sharing research papers
Exec=/opt/mendeley/mendeley/bin/mendeleydesktop %u
Icon=mendeleydesktop
Terminal=false
Type=Application
Categories=Education;Literature;Qt;
X-SuSE-translate=false
MimeType=x-scheme-handler/mendeley;application/pdf;text/x-bibtex;
X-Mendeley-Version=1
EOF
