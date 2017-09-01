#!/bin/bash

xdg-icon-resource uninstall --novendor --size "512" "xmind"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/XMind"
rm -f "/usr/share/applications/xmind.desktop"
rm -rf "/opt/xmind"
