#!/bin/bash

rpm --import http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Fedora_25/repodata/repomd.xml.key
wget http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Fedora_25/home:pbek:QOwnNotes.repo -O /etc/yum.repos.d/QOwnNotes.repo
dnf -y install qownnotes 
