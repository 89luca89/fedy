#!/bin/bash

rm -r "/usr/bin/Headset"
rm -rf "/usr/lib/Headset"
rm -f "/usr/share/applications/Headset.desktop"
rm -rf "/usr/share/doc/Headset"
rm -rf "/usr/share/lintian/overrides/Headset"
rm -f "/usr/share/pixmaps/Headset.png"

gtk-update-icon-cache -f -t /usr/share/icons/hicolor


