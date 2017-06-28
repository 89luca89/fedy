#!/bin/bash

xdg-icon-resource uninstall --novendor --size "128" "pomodone"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/bin/pomodone"
rm -f "/usr/share/applications/pomodone.desktop"
rm -rf "/opt/pomodone"
