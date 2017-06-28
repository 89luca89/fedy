#!/bin/bash

dnf -y install libappindicator-gtk*

CACHEDIR="/var/cache/fedy/telegram";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL="https://telegram.org/dl/desktop/linux"
FILE="tsetup.tar.xz"

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

rm -rf "/opt/Telegram"
tar xf "$FILE" -C "/opt/"

ln -sf "/opt/Telegram/Telegram" "/usr/bin/telegram"


echo "[Desktop Entry]
Version=1.0
Name=Telegram Desktop
Comment=Official desktop version of Telegram messaging app
TryExec=/opt/Telegram/Telegram
Exec=/opt/Telegram/Telegram -- %u
Icon=telegram
Terminal=false
StartupWMClass=TelegramDesktop
Type=Application
Categories=Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
X-Desktop-File-Install-Version=0.23" | tee /usr/share/applications/telegramdesktop.desktop


