#!/bin/bash

xdg-icon-resource uninstall --novendor --size "256" "soundnode"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/soundnode"
rm -f "/usr/share/applications/soundnode.desktop"
rm -rf "/opt/Soundnode"
