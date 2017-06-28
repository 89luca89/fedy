dnf -y install phonon-qt5 alien

CACHEDIR="/var/cache/fedy/minitube";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL=$(wget "https://github.com/headsetapp/headset-electron/releases/" -O - | grep .deb  | head -n4 | sed 's/<a href=\"//g' | sed 's/\" rel=\"nofollow\">//g' | grep -v strong)
URL=$(echo "www.github.com"$URL | sed 's/ //g')
FILE=${URL##*/}


wget -c $URL -O $FILE

alien -r --scripts $FILE
mv Headset*.rpm headset.rpm
rpm2cpio headset.rpm | cpio -vid

cp -r ./usr/* /usr/
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

