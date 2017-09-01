#!/bin/bash

xdg-icon-resource uninstall --novendor --size "128" "whatever"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor
dnf -y remove Whatever
rm -rf "/opt/Whatever"
