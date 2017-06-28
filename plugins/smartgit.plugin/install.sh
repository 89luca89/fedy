#!/bin/bash

dnf -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

CACHEDIR="/var/cache/fedy/smartgit-generic";
mkdir -p "$CACHEDIR"
cd "$CACHEDIR"
pkgver=$(wget https://www.syntevo.com/smartgit/changelog.txt -O - | head -n 1 |  grep -Po '\d\d.\d.\d' | head -n 1 | tr '.' '_')
FILE=smartgit-linux-$pkgver.tar.gz
URL=http://www.syntevo.com/static/smart/download/smartgit/$FILE

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

tar -xzf "$FILE" -C "/opt/"

ln -sf "/opt/smartgit/bin/smartgit.sh" "/usr/bin/smartgit"
/opt/smartgit/bin/add-menuitem.sh
