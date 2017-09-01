#!/bin/bash

CACHEDIR="/var/cache/fedy/pomodone";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL="https://app.pomodoneapp.com/installers/Linux64.tar.gz"
	ARCH=
else
	# 32 bit
	URL="https://app.pomodoneapp.com/installers/Linux32.tar.gz"
	ARCH="-ia32"
fi
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/pomodone"
mkdir -p "/opt/pomodone"
tar xvxf "$FILE" -C "/opt/pomodone"

ln -sf "/opt/pomodone/linux"$ARCH"/PomoDoneApp" "/usr/bin/pomodone"

wget -c "https://pomodoneapp.com/assets/images/logo-big.png" -O "/opt/pomodone/linux"$ARCH"/pomodone.png"

xdg-icon-resource install --novendor --size "128" "/opt/pomodone/linux"$ARCH"/pomodone.png" "pomodone"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat <<EOF | tee /usr/share/applications/pomodone.desktop
[Desktop Entry]
Name=PomoDone
GenericName=Office
Icon=pomodone
Type=Application
Categories=Application;Network;
Encoding=UTF-8
Exec=/opt/pomodone/linux$ARCH/PomoDoneApp %u
Terminal=false
StartupNotify=false
StartupWMClass=pomodone
Name[en_US]=pomodone
EOF
