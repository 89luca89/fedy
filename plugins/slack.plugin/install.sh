#!/bin/bash

echo '[slack]
name=slack
baseurl=https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64
enabled=1
gpgcheck=0
gpgkey=https://packagecloud.io/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
' | tee /etc/yum.repos.d/slack.repo
dnf -y install slack
