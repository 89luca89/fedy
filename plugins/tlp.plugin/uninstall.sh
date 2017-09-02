#!/bin/bash

tlp false
systemctl disable powertop.service
systemctl disable tlp.service
systemctl disable tlp-sleep.service

dnf -y remove tlp tlp-rdw powertop smartmontools
