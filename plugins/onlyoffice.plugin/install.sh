#!/bin/bash

rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8320CA65CB2DE8E5"
echo '[onlyoffice]
name=onlyoffice repo
baseurl=http://download.onlyoffice.com/repo/centos/main/noarch/
gpgcheck=1
enabled=1' | tee /etc/yum.repos.d/onlyoffice.repo
dnf -y install onlyoffice-desktopeditors
