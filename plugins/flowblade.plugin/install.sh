#!/bin/bash

dnf -y install flowblade

# Little fix to start flowblade on Wayland
echo "[Desktop Entry]
Name=Flowblade Movie Editor
GenericName=Movie Editor
X-GNOME-FullName=Flowblade Movie Editor
Comment=Edit media to create movies
Exec=env GDK_BACKEND=x11 flowblade %f
Terminal=false
Type=Application
Icon=flowblade
Categories=GNOME;GTK;AudioVideo;AudioVideoEditing;
MimeType=application/vnd.flowblade-project;
X-Ubuntu-Gettext-Domain=Flowblade
Name[en_US]=flowblade" | tee /usr/share/applications/flowblade.desktop

