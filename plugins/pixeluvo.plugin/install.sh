#!/bin/bash

CACHEDIR="/var/cache/fedy/pixeluvo";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL="http://www.pixeluvo.com/downloads/pixeluvo-1.6.0-2.x86_64.rpm"
else
	# 32 bit
	URL="http://www.pixeluvo.com/downloads/pixeluvo-1.6.0-1.i686.rpm"
fi
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi  

dnf -y install "$FILE"
