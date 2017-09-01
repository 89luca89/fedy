#!/bin/bash

CACHEDIR="/var/cache/fedy/kaku";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

pkgver=$(wget "https://github.com/EragonJ/Kaku/releases" -O - | grep '<a href="/EragonJ/Kaku/tree/' | head -n 1 | sed 's/.*\///' | sed 's/\" .*//')

arch | grep x86_64
if (( $? == 0));then
    # 64 bit
    URL="https://github.com/funilrys/Kaku/releases/download/$pkgver-Linux/Kaku-$pkgver.tar.gz"
else
    # 32 bit
    URL="https://github.com/funilrys/Kaku/releases/download/$pkgver-Linux/Kaku-$pkgver-ia32.tar.gz"
fi
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
    exit 1
fi

rm -rf "/opt/kaku"
mkdir -p "/opt/kaku"
tar xvxf "$FILE" -C "/opt/kaku"

ln -sf "/opt/kaku/Kaku-$pkgver/Kaku" "/usr/bin/kaku"

wget "http://kaku.rocks/public/img/logo.png" -O "/opt/kaku/Kaku-$pkgver/kaku.png"

xdg-icon-resource install --novendor --size "256" "/opt/kaku/Kaku-$pkgver/kaku.png" "kaku"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat <<EOF | tee /usr/share/applications/kaku.desktop
[Desktop Entry]
Encoding=UTF-8
Version=1.8.5
Name=Kaku
Comment=The next generation music client http://kaku.rocks
Exec=/usr/bin/kaku
Icon=kaku
Terminal=false
Type=Application
Categories=Application;Audio;AudioVideo;
EOF
