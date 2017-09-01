CACHEDIR="/var/cache/fedy/xmind";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL="http://dl2.xmind.net/xmind-downloads/xmind-8-update3-linux.zip"
wget -c "$URL" -O "xmind.zip"

if [[ ! -f "xmind.zip" ]]; then
	exit 1
fi
rm -rf "/opt/xmind"
mkdir -p "/opt/xmind"
unzip -xq "xmind.zip" -d "/opt/xmind"

cpuArch=$(lscpu | grep 'Architecture' | awk '{print $2}')
[ "$cpuArch" = "64" ] && cpuArchTag="amd64" || cpuArchTag="i386"
ln -sf "/opt/xmind/XMind_${cpuArchTag}" "/usr/bin/xmind"

wget -c "http://s3.amazonaws.com/xmindnet/blog/en/new_branding_new_logo" -O xmind.png
xdg-icon-resource install --novendor --size "512" "/opt/xmind/resources/app.asar.unpacked/assets/xmind.png" "xmind"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat <<EOF | tee /usr/share/applications/xmind.desktop
[Desktop Entry]
Name=XMind
GenericName=Organizer
Icon=xmind
Type=Application
Categories=Application;Drawing;
Encoding=UTF-8
Exec=/usr/bin/xmind %u
Terminal=false
StartupNotify=false
StartupWMClass=xmind
Name[en_US]=XMind
EOF
