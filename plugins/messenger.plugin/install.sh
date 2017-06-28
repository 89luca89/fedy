#!/bin/bash

dnf -y install libappindicator-gtk*

CACHEDIR="/var/cache/fedy/messenger";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL=$(wget "https://github.com/Aluxian/Messenger-for-Desktop/releases" -O - | grep linux-x86_64.rpm | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | head -n 1)
else
	# 32 bit
	URL=$(wget "https://github.com/Aluxian/Messenger-for-Desktop/releases" -O - | grep linux-i386.rpm | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | head -n 1)
fi
URL=$(echo "www.github.com"$URL | sed 's/ //g')
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi  

dnf -y install "$FILE"
