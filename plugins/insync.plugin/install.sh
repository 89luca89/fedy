#!/bin/bash

echo '[insync]
name=insync repo
baseurl=http://yum.insynchq.com/fedora/$releasever/
gpgcheck=1
gpgkey=https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
enabled=1
repo_gpgcheck=1
metadata_expire=6h' | tee /etc/yum.repos.d/insync.repo
rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
dnf -y install insync
