#!/bin/bash

xdg-icon-resource uninstall --novendor --size "128" "sunvox"

gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/sunvox"
rm -f "/usr/share/applications/sunvox.desktop"
rm -rf "/opt/sunvox"
