#!/bin/bash

xdg-icon-resource uninstall --novendor --size "96" "franz"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/franz"
rm -f "/usr/share/applications/franz.desktop"
rm -rf "/opt/franz"
