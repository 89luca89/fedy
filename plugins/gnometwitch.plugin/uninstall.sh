#!/bin/bash

dnf copr -y disable ippytraxx/gnome-twitch
dnf -y --setopt clean_requirements_on_remove=1 erase gnome-twitch -y
