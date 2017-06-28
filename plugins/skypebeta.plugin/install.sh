#!/bin/bash

echo '[skype-stable]
name=skype (stable)
baseurl=https://repo.skype.com/rpm/stable/
enabled=1
gpgcheck=1
gpgkey=https://repo.skype.com/data/SKYPE-GPG-KEY' | tee /etc/yum.repos.d/skype-stable.repo


dnf -y install skypeforlinux
