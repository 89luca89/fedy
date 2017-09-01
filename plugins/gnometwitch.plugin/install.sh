#!/bin/bash

dnf copr -y enable ippytraxx/gnome-twitch
dnf -y install gnome-twitch gstreamer1-libav --releasever=24
