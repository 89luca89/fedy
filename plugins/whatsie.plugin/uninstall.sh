#!/bin/bash

rm -r "/opt/whatsie"
rm "/usr/share/applications/whatsie.desktop"
find /usr/share/icons/hicolor/ -name whatsie.png -delete
gtk-update-icon-cache -f -t /usr/share/icons/hicolor
