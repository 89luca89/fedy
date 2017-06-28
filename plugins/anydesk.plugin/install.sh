#!/bin/bash


arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL=$(wget https://anydesk.it/download -O - | grep -i 'Red Hat Enterprise Linux 7'  | sed 's/.*="//g' | sed 's/">.*//'| tail -n1)
else
	# 32 bit 
	URL=$(wget https://anydesk.it/download -O - | grep -i 'Red Hat Enterprise Linux 7'  | sed 's/.*="//g' | sed 's/">.*//'| head -n1)
fi
wget $URL -O "/tmp/anydesk.rpm"
dnf -y install "/tmp/anydesk.rpm"
