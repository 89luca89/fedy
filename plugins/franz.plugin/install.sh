#!/bin/bash

dnf -y install libappindicator-gtk*

CACHEDIR="/var/cache/fedy/franz";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL=$(wget "https://github.com/meetfranz/franz-app/releases/" -O - | grep Franz-linux | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | tail -n 1)
else
	# 32 bit
	URL=$(wget "https://github.com/meetfranz/franz-app/releases/" -O - | grep Franz-linux | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | head -n 1)
fi
URL=$(echo "www.github.com"$URL | sed 's/ //g')
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/franz"
mkdir -p "/opt/franz"
tar xvxf "$FILE" -C "/opt/franz"

ln -sf "/opt/franz/Franz" "/usr/bin/franz"

xdg-icon-resource install --novendor --size "96" "/opt/franz/resources/app.asar.unpacked/assets/franz.png" "franz"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat <<EOF | tee /usr/share/applications/franz.desktop
[Desktop Entry]
Name=Franz
GenericName=Chat
Icon=franz
Type=Application
Categories=Application;Network;
Encoding=UTF-8
Exec=/opt/franz/Franz %u
Terminal=false
StartupNotify=false
StartupWMClass=Franz
Name[en_US]=Franz
EOF
