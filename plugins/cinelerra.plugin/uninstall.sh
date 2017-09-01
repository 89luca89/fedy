#!/bin/bash

rm "/usr/lib64/libbz2.so.1.0"

xdg-icon-resource uninstall --novendor --size "96" "cinelerra"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/cinelerra"
rm -f "/usr/share/applications/cinelerra.desktop"
rm -rf "/opt/Cinelerra"
