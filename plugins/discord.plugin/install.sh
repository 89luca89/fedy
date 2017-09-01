#!/bin/bash

CACHEDIR="/var/cache/fedy/discord";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

VERSION="0.0.1"

URL="https://dl.discordapp.net/apps/linux/"$VERSION"/discord-"$VERSION".tar.gz"
FILE="discord.tar.gz"

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/Discord"
tar xf "$FILE" -C "/opt/"

ln -sf "/opt/Discord/Discord" "/usr/bin/discord"


xdg-icon-resource install --novendor --size "256" "/opt/Discord/discord.png" "discord"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

echo "[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=/opt/Discord/Discord
Icon=discord
Type=Application
StartupNotify=true
Categories=Network;InstantMessaging;" | tee /usr/share/applications/discord.desktop


