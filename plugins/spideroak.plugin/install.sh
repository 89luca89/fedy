#!/bin/bash

CACHEDIR="/var/cache/fedy/spideroak";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL="https://spideroak.com/getbuild?platform=fedora&arch=x86_64"
else
	# 32 bit
	URL="https://spideroak.com/getbuild?platform=fedora&arch=i386"
fi
FILE="spideroak.rpm"

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

dnf -y install $FILE


