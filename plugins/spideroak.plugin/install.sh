#!/bin/bash

CACHEDIR="/var/cache/fedy/spideroak";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

if command arch | grep 'x86_64'; then
	# 64 bit
	URL="https://spideroak.com/release/spideroak/rpm_x64"
else
	# 32 bit
	URL="https://spideroak.com/release/spideroak/rpm_x86"
fi
FILE="spideroak.rpm"

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

dnf -y install $FILE

