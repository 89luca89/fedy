#!/bin/bash

rm "/usr/bin/minitube"
rm "/usr/share/applications/minitube.desktop"
rm -rf "/usr/share/doc/minitube"
rm "/usr/share/menu/minitube"
rm -rf "/usr/share/minitube"
find /usr/share/icons/hicolor/ -name minitube.png -delete
gtk-update-icon-cache -f -t /usr/share/icons/hicolor
