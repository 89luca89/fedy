#!/bin/bash


arch | grep x86_64
if (( $? == 0));then
	# 64 bit
	URL="http://infinitekind.com/stabledl/current/moneydance_linux_amd64.rpm"
else
	# 32 bit 
	URL="http://infinitekind.com/stabledl/current/moneydance_linux_x86.rpm"
fi
wget $URL -O "/tmp/moneydance.rpm"
dnf -y install "/tmp/moneydance.rpm"
