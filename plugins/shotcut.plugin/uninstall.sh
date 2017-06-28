#!/bin/bash

xdg-icon-resource uninstall --novendor --size "256" "shotcut"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/shotcut"
rm -f "/usr/share/applications/Shotcut.desktop"
rm -rf "/opt/Shotcut"
