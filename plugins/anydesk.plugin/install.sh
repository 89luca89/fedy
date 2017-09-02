#!/bin/env bash

CACHEDIR="/var/cache/fedy/Anydesk";                                                                                                                           
mkdir -p "$CACHEDIR"    
cd "$CACHEDIR"

VERSION=$(wget https://anydesk.com/download -O - |\
    grep -e "v.[0-9].[0-9].[0-9]" |\
    head -n 1 |\
    sed 's/<small>//' |\
    sed 's/<\/small><br>//' |\
    sed 's/ //g' |\
    sed 's/\t//g')

arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL="https://download.anydesk.com/linux/rhel7/anydesk-"$VERSION"-1.el7.x86_64.rpm"
else
	# 32 bit 
	URL="https://download.anydesk.com/linux/rhel7/anydesk-"$VERSION"-1.el7.i686.rpm"
fi
wget $URL -O "/var/cache/fedy/Anydesk/anydesk.rpm"
dnf -y install "/var/cache/fedy/Anydesk/anydesk.rpm"
