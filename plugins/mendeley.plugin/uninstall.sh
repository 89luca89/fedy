#!/bin/bash

xdg-icon-resource uninstall --novendor --size "128" "mendeleydesktop"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/mendeley"
rm -f "/usr/share/applications/mendeleydesktop.desktop"
rm -rf "/opt/mendeley"
