#!/bin/bash

CACHEDIR="/var/cache/fedy/Google-Play-Music-Desktop-Player";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL=$(wget "https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases" -O - | grep google-play-music-desktop-player | grep rpm | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | tail -n 1)
else
	# 32 bit
	URL=$(wget "https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases" -O - | grep google-play-music-desktop-player | grep rpm | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong | head -n 1)
fi
URL=$(echo "www.github.com"$URL | sed 's/ //g')
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

dnf -y install "$FILE"
