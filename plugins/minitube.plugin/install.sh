dnf -y install phonon-qt5 alien

CACHEDIR="/var/cache/fedy/minitube";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

#arch | grep x86_64
#if (( $? == 0));then
#  # 64 bit
#  URL="http://ftp.us.debian.org/debian/pool/main/m/minitube/minitube_2.5.2-2_amd64.deb"
#else
#  # 32 bit
#  URL="http://ftp.us.debian.org/debian/pool/main/m/minitube/minitube_2.5.2-2_i386.deb"
#fi

wget -c "http://flavio.tordini.org/files/minitube/minitube.deb" -O "minitube.deb"

alien -r --scripts minitube.deb
mv minitube*.rpm minitube.rpm
rpm2cpio minitube.rpm | cpio -vid

for d in "/home/"*; do
	mkdir -p "$d/.local/share/Flavio Tordini/Minitube"
done

chmod 777 /home/*/.local/share/Flavio\ Tordini/Minitube
cp -r ./usr/* /usr/
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

