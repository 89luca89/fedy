#!/bin/bash

xdg-icon-resource uninstall --novendor --size "256" "kaku"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/kaku"
rm -f "/usr/share/applications/kaku.desktop"
rm -rf "/opt/kaku"
